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
        @Published private(set) var league: League? = nil
        @Published var loadingState = LoadingState.loading
        @Published private(set) var teams = [Team]()
        
        @Published var searchText = ""
        
        func updateSelectedleague(league: League){
            self.league = league
        }
        
        var searchResults: [Team] {
            if searchText.isEmpty {
                return teams
            } else {
                return teams.filter { $0.strTeam!.contains(searchText) }
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
                teams = items.teams!.sorted()
                teams = self.removeOneOnTwo(teams)
                loadingState = .loaded
            } catch {
                loadingState = .failed
            }
        }
        
        func removeOneOnTwo(_ teams: [Team]) -> [Team] {
            var cleanedArr = [Team]()
            
            for i in 0 ..< teams.count {
                if (i % 2 == 0 ) {
                    cleanedArr.append(teams[i])
                    print(i)
                }
            }
            return cleanedArr
        }
    }
}
