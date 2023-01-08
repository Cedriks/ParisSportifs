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

        func updateSelectedTeam(team: Team) {
            self.team = team
        }
        
        // MARK: - Data Recovery
        func getTeamInformations() async {
            guard let strTeam = self.team?.strTeam else {
                loadingState = .failed
                print("No strTeam")
                return
            }
            do {
                self.team = try await WebService().fetchTeamInformations(strTeam: strTeam)
            } catch {
                print(error)
                loadingState = .failed
            }
            loadingState = .loaded
        }
    }
}
