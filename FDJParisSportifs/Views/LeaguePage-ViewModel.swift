//
//  LeaguePage-ViewModel.swift
//  FDJParisSportifs
//
//  Created by Cedrik on 06/01/2023.
//

import Foundation
import SwiftUI

extension LeaguePage {
    @MainActor class ViewModel: ObservableObject {
        @Published var league: League? = nil
        @Published var loadingState = LoadingState.loading
        @Published private(set) var teams = [Team]()
        
        @Published var searchText = ""
        
        var searchResults: [Team] {
            if searchText.isEmpty {
                return teams
            } else {
                return teams.filter { $0.strTeam.contains(searchText) }
            }
        }
        
        func fetchAllLeagueTeams() async {
            guard let strLeague = league?.strLeague else {
                loadingState = .failed
                return
            }
            let urlEncoded: String = strLeague.addingPercentEncoding(withAllowedCharacters: .alphanumerics)!
            let urlString = "https://www.thesportsdb.com/api/v1/json/50130162/search_all_teams.php?l=" + urlEncoded
            guard let url = URL(string: urlString) else {
                print("Bad URL: \(urlString)")
                return
            }
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                let items = try JSONDecoder().decode(Result.self, from: data)
                teams = items.teams!
                loadingState = .loaded
            } catch {
                loadingState = .failed
            }
        }
    }
}
