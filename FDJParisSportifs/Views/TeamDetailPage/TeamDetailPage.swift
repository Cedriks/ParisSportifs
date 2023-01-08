//
//  TeamDetailPage.swift
//  FDJParisSportifs
//
//  Created by Cedrik on 06/01/2023.
//

import SwiftUI

struct TeamDetailPage: View {
    @Environment(\.dismiss) var dismiss
    @StateObject private var viewModel = ViewModel()
    var team: Team
    
    //MARK: - View
    var body: some View {
        switch viewModel.loadingState {
        case .loading:
            LoadingView()
                .task {
                    loadingActions()
                }
        case .loaded:
            TeamDetailLoadedView(team: team)
        case .failed:
            FailedView(reloadButton: false,
                       loadingState: $viewModel.loadingState)
            .task {
                dismiss()
            }
        }
    }
    
    //MARK: - Methods
    
    func loadingActions() {
        Task {
            viewModel.updateSelectedTeam(team: team)
            await viewModel.getTeamInformations()
        }
    }
}

struct TeamDetailPage_Previews: PreviewProvider {
    static var previews: some View {
        TeamDetailPage(team: Team.example)
    }
}
