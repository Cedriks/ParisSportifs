//
//  LeaguePage.swift
//  FDJParisSportifs
//
//  Created by Cedrik on 06/01/2023.
//

import SwiftUI

struct LeaguePage: View {
    @Environment(\.dismiss) var dismiss
    @StateObject private var viewModel = ViewModel()
    var league: League
    
    // MARK: - View
    var body: some View {
        switch viewModel.loadingState {
        case .loading:
            LoadingView()
                .task {
                    loadingActions()
                }
        case .loaded:
            List(viewModel.searchResults, id: \.idTeam) { team in
                NavigationLink(destination: TeamDetailPage(team: team)) {
                    TeamRow(team: team)
                }
                .accessibilityIdentifier("teamNavigationLink")
            }.accessibilityIdentifier("teamList")
                .searchable(text: $viewModel.searchText)
                .navigationTitle(league.strLeague!)
        case .failed:
            FailedView(reloadButton: false,
                       loadingState: $viewModel.loadingState)
            .task {
                dismiss()
            }
        }
    }
    // MARK: - Methods
    func loadingActions() {
        Task {
            viewModel.updateSelectedleague(league: league)
            await viewModel.getAllLeagueTeams()
        }
    }
}

struct LeaguePage_Previews: PreviewProvider {
    static var previews: some View {
        LeaguePage(league: League.example)
    }
}
