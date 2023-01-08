//
//  ContentView.swift
//  FDJParisSportifs
//
//  Created by Cedrik on 06/01/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ViewModel()
    
    // MARK: - View
    var body: some View {
        NavigationView {
            switch viewModel.loadingState {
            case .loading:
                LoadingView()
                    .task {
                        loadingActions()
                    }
            case .loaded:
                List(viewModel.searchResults, id: \.idLeague) { league in
                    NavigationLink(destination: LeaguePage(league: league)) {
                        LeagueRow(league: league)
                    }.accessibilityIdentifier("leagueNavigationLink")
                }
                .searchable(text: $viewModel.searchText)
                .navigationTitle("Paris Sportifs")
            case .failed:
                FailedView(reloadButton: true,
                           loadingState: $viewModel.loadingState)
            }
        }
    }
    // MARK: - Methods
    func loadingActions() {
        Task {
            await viewModel.getAllLeagues()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
