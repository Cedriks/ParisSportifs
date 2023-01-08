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
                    HStack {
                        if(team.strTeamBadge != nil) {
                            AsyncImage(
                                url: URL(string: team.strTeamBadge!),
                                content:{ image in
                                    image.resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(maxWidth: 40)
                                        .padding(.horizontal, 4.0)
                                },
                                placeholder: {
                                    ProgressView()
                                        .frame(maxWidth: 48)
                                }
                            )
                        }
                        VStack(alignment: .leading) {
                            Text(team.strTeam)
                                .font(.headline)
                            Text(team.strAlternate!)
                                .italic()
                        }
                    }
                }
                .accessibilityIdentifier("teamNavigationLink")
            }.accessibilityIdentifier("teamList")
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
