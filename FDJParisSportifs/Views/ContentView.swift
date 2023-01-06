//
//  ContentView.swift
//  FDJParisSportifs
//
//  Created by Cedrik on 06/01/2023.
//

import SwiftUI

struct ContentView: View {
    enum LoadingState {
        case loading, loaded, failed
    }

    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            switch viewModel.loadingState {
            case .loading:
                VStack {
                    Text("Loading")
                }.task {
                    await viewModel.fetchAllLeagues()
                }
            case .loaded:
                List(viewModel.searchResults, id: \.idLeague) { league in
                    NavigationLink(destination: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Destination@*/Text("Destination")/*@END_MENU_TOKEN@*/) {
                        Text(league.strLeague ?? "-")
                            .font(.headline)
                        + Text(": ")
                        + Text(league.strSport ?? "-")
                            .italic()
                    }
                }
                .searchable(text: $viewModel.searchText)
                .navigationTitle("Paris Sportifs")
            case .failed:
                VStack {
                    Spacer()
                    Text("Please try later")
                    Spacer()
                    Button("Unlock Places") {
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
