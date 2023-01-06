//
//  TeamDetailPage-ViewModel.swift
//  FDJParisSportifs
//
//  Created by Cedrik on 06/01/2023.
//

import Foundation

extension TeamDetailPage {
    @MainActor class ViewModel: ObservableObject {
        @Published private(set) var team: Team?
        @Published var loadingState = LoadingState.loading

        func updateSelectedTeam(team: Team){
            self.team = team
        }
        
        func fetchTeamInformations() async {
            guard let strTeam = team?.strTeam else {
                loadingState = .failed
                return
            }
            let urlEncoded: String = strTeam.addingPercentEncoding(withAllowedCharacters: .alphanumerics)!
            let urlString = "https://www.thesportsdb.com/api/v1/json/50130162/searchteams.php?t=" + urlEncoded
            guard let url = URL(string: urlString) else {
                print("Bad URL: \(urlString)")
                return
            }
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                let items = try JSONDecoder().decode(Result.self, from: data)
                team = items.teams!.first
                loadingState = .loaded
            } catch {
                print(error)
                loadingState = .failed
            }
        }
    }
}
