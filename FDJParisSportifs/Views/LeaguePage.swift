//
//  LeaguePage.swift
//  FDJParisSportifs
//
//  Created by Cedrik on 06/01/2023.
//

import SwiftUI


struct LeaguePage: View {
    enum LoadingState {
        case loading, loaded, failed
    }
    var league: League
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        switch viewModel.loadingState {
        case .loading:
            VStack {
                Text("Loading")
            }.task {
                viewModel.league = league
                await viewModel.fetchAllLeagueTeams()
            }
        case .loaded:
            List(viewModel.searchResults, id: \.idTeam) { team in
                // TODO: Navigation to Detail team page
                NavigationLink(destination: LeaguePage(league: league)) {
                    Text(team.strTeam)
                        .font(.headline)
                    + Text(": ")
                    + Text(team.strAlternate)
                        .italic()
                }
            }
            .searchable(text: $viewModel.searchText)
            .navigationTitle(league.strLeague!)
        case .failed:
            VStack {
                Spacer()
                Text("Please try later")
                Spacer()
                Button("Reload") {
                    viewModel.loadingState = .loading
                }
                .padding()
                .background(.blue)
                .foregroundColor(.white)
                .clipShape(Capsule())
            }
        }
    }
}

struct LeaguePage_Previews: PreviewProvider {
    static var previews: some View {
        LeaguePage(league: League.example)
    }
}
