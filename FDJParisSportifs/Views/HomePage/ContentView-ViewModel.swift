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
        
        func getAllLeagues() async {
            do {
                self.leagues = try await WebService().fetchAllLeagues()
                loadingState = .loaded
            } catch {
                print(error)
                loadingState = .failed
            }
        }
    }
}
