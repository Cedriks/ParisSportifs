//
//  ContentView-ViewModel.swift
//  FDJParisSportifs
//
//  Created by Cedrik on 06/01/2023.
//

import Foundation

extension ContentView {
    @MainActor class ViewModel: ObservableObject {
        @Published var loadingState = LoadingState.loading
        @Published private(set) var leagues = [League]()
        
        @Published var searchText = ""
        
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
}
