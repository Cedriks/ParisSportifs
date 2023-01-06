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
    @State private var loadingState = LoadingState.loading
    @State private var leagues = [League]()
    
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            switch loadingState {
            case .loading:
                VStack {
                    Text("Loading")
                }.task {
                    await fetchAllLeagues()
                }
            case .loaded:
                List(searchResults, id: \.idLeague) { league in
                    NavigationLink(destination: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Destination@*/Text("Destination")/*@END_MENU_TOKEN@*/) {
                        Text(league.strLeague ?? "-")
                            .font(.headline)
                        + Text(": ")
                        + Text(league.strSport ?? "-")
                            .italic()
                    }
                }
                .searchable(text: $searchText)
                .navigationTitle("Paris Sportifs")
            case .failed:
                VStack {
                    Spacer()
                    Text("Please try later")
                    Spacer()
                    Button("Unlock Places") {
                        loadingState = .loading
                    }
                    .padding()
                    .background(.blue)
                    .foregroundColor(.white)
                    .clipShape(Capsule())
                }
            }
        }
    }
    
    var searchResults: [League] {
        if searchText.isEmpty {
            return leagues
        } else {
            return leagues.filter { $0.strLeague!.contains(searchText) }
        }
    }
    
    func fetchAllLeagues() async {
        let urlString = "https://www.thesportsdb.com/api/v1/json/50130162/all_leagues.php"
        
        guard let url = URL(string: urlString) else {
            print("Bad URL: \(urlString)")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let items = try JSONDecoder().decode(Result.self, from: data)
            leagues = items.leagues
            loadingState = .loaded
        } catch {
            loadingState = .failed
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
