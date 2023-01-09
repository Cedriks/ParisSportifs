//
//  LeaguePage.swift
//  FDJParisSportifs
//
//  Created by Cedrik on 06/01/2023.
//

import SwiftUI

struct LeaguePage: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel: ViewModel

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
                NavigationLink(
                    destination: TeamDetailPage(viewModel: TeamDetailPage.ViewModel(team: team))
                ) {
                    TeamRow(team: team)
                }
                .accessibilityIdentifier("teamNavigationLink")
            }.accessibilityIdentifier("teamList")
                .searchable(text: $viewModel.searchText)
                .navigationTitle(viewModel.league.strLeague!)
        case .failed:
            FailedView(isReloadButtonDisplayable: false,
                       loadingState: $viewModel.loadingState)
            .task {
                dismiss()
            }
        }
    }
    // MARK: - Methods
    func loadingActions() {
        Task {
            await viewModel.getAllLeagueTeams()
        }
    }
}

struct LeaguePage_Previews: PreviewProvider {
    static var previews: some View {
        LeaguePage(viewModel: LeaguePage.ViewModel(league: League(
            idLeague: "12345",
            strLeague: "strLeague",
            strSport: "strSport",
            strLeagueAlternate: "strLeagueAlternate"
        )))
    }
}
