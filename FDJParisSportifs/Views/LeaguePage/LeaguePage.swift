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

    
    var body: some View {
        switch viewModel.loadingState {
        case .loading:
            VStack {
                ProgressView()
                Text("Loading")
            }.task {
                viewModel.updateSelectedleague(league: league)
                await viewModel.getAllLeagueTeams()
            }
        case .loaded:
            List(viewModel.searchResults, id: \.idTeam) { team in
                // TODO: Navigation to Detail team page
                NavigationLink(destination: TeamDetailPage(team: team)) {
                    Text(team.strTeam!)
                        .font(.headline)
                    + Text(": ")
                    + Text(team.strAlternate!)
                        .italic()
                }
            }
            .searchable(text: $viewModel.searchText)
            .navigationTitle(league.strLeague!)
        case .failed:
            VStack {
                Text("Please try later")
            }.task {
                dismiss()
            }
        }
    }
}

struct LeaguePage_Previews: PreviewProvider {
    static var previews: some View {
        LeaguePage(league: League.example)
    }
}
