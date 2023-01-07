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
        // MARK: - Data Recovery
        func getAllLeagueTeams() async {
            var teams = [Team]()
            guard let strLeague = league?.strLeague else {
                loadingState = .failed
                print("No strLeague")
                return
            }
            do {
                teams = try await WebService().fetchAllLeagueTeams(strLeague: strLeague)
            } catch {
                print(error)
                loadingState = .failed
            }
            self.teams = applyStatementConstraints(teams)
            loadingState = .loaded
        }
        
        // MARK: - Statement Constraints
        /// - sort anti-alphabetically
        /// - Show only 1 out of 2 teams
        
        func applyStatementConstraints (_ teams: [Team]) -> [Team] {
            return removeOneOnTwo(teams).sorted()
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
