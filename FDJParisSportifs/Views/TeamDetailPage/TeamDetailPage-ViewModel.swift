//
//  TeamDetailPage-ViewModel.swift
//  FDJParisSportifs
//
//  Created by Cedrik on 06/01/2023.
//

import Foundation

extension TeamDetailPage {
    @MainActor class ViewModel: ObservableObject {
        @Published private(set) var team: Team
        @Published var loadingState = LoadingState.loading
        private let teamInformationNetworker: TeamInformationNetworking
        
        init(teamInformationNetworker: TeamInformationNetworking = TeamInformationNetworker(), team: Team) {
            self.teamInformationNetworker = teamInformationNetworker
            self.team = team
        }
        
//        func updateSelectedTeam(team: Team) {
//            self.team = team
//        }
        
        func getTeamInformations() async {
            let strTeam = self.team.strTeam
//            guard let strTeam = self.team?.strTeam else {
//                loadingState = .failed
//                print("No strTeam")
//                return
//            }
            do {
                self.team = try await teamInformationNetworker.fetchTeamInformation(strTeam: strTeam)
                loadingState = .loaded
            } catch {
                print(error)
                loadingState = .failed
            }
          
        }
    }
}
