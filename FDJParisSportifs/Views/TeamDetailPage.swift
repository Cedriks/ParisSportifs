//
//  TeamDetailPage.swift
//  FDJParisSportifs
//
//  Created by Cedrik on 06/01/2023.
//

import SwiftUI

struct TeamDetailPage: View {
  
    @Environment(\.dismiss) var dismiss
    
    var team: Team
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        switch viewModel.loadingState {
        case .loading:
            VStack {
                Text("Loading")
            }.task {
                viewModel.updateSelectedTeam(team: team)
                await viewModel.fetchTeamInformations()
            }
        case .loaded:
            Text(viewModel.team?.strTeam ?? "-")
            .navigationTitle(team.strTeam!)
        case .failed:
            VStack {
                Text("Please try later")
            }.task {
                dismiss()
            }
        }
    }
}

struct TeamDetailPage_Previews: PreviewProvider {
    static var previews: some View {
        TeamDetailPage(team: Team.example)
    }
}
