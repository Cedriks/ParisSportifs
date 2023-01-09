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
        @Published private(set) var league: League
        @Published var loadingState = LoadingState.loading
        @Published private(set) var teams = [Team]()
        
        @Published var searchText = ""
        private let allLeagueTeamsNetworker : AllLeagueTeamsNetworking
        
        init(allLeagueTeamsNetworker: AllLeagueTeamsNetworking = AllLeagueTeamsNetworker(), league: League){
            self.allLeagueTeamsNetworker = allLeagueTeamsNetworker
            self.league = league
        }
        
        var searchResults: [Team] {
            if searchText.isEmpty {
                return teams
            } else {
                return teams.filter { $0.strTeam.contains(searchText) }
            }
        }
        
        // MARK: - Data Recovery
        func getAllLeagueTeams() async {
            loadingState = .loaded
            var teams = [Team]()
            guard let strLeague = self.league.strLeague else {
                loadingState = .failed
                print("No league selected found")
                return
            }
            do {
                teams = try await allLeagueTeamsNetworker.fetchAllLeagueTeams(strLeague: strLeague)
            } catch {
                print(error)
                loadingState = .failed
            }
            self.teams = applyStatementConstraints(teams)
        }
        
        // MARK: - Statement Constraints
        
        private func applyStatementConstraints(_ teams: [Team]) -> [Team] {
            return teams
            /// - Sort anti-alphabetically.
                .sorted()
                .enumerated()
            /// - Show only 1 out of 2 teams.
                .filter { $0.offset %  2  ==  0 }
                .map { (index, team) in
                    return team
                }
        }
    }
}
