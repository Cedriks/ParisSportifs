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
                ProgressView()
                Text("Loading")
            }.task {
                viewModel.updateSelectedTeam(team: team)
                await viewModel.getTeamInformations()
            }
        case .loaded:
            ZStack {
                VStack {
                    Spacer()
                    AsyncImage(
                        url: URL(string: team.strTeamBadge!),
                        content:{ image in
                            image.resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: UIScreen.main.bounds.height)
                            .opacity(0.2)
                            .padding(.horizontal)
                        },
                        placeholder: {
                            ProgressView()
                        }
                    )
                    Spacer()
                        .frame(height: 40)
                }
                VStack {
                    ScrollView([.vertical]) {
                        if(team.strTeamBanner != nil) {
                            AsyncImage(
                                url: URL(string: team.strTeamBanner!),
                                content:{ image in
                                    image.resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(maxWidth: UIScreen.main.bounds.width)
                                        .cornerRadius(4)
                                        .padding(.horizontal, 4.0)
                                },
                                placeholder: {
                                    ProgressView()
                                }
                            )
                        }
                        Text(team.strCountry ?? "-")
                            .font(.title)
                        Text(team.strLeague ?? "-")
                            .font(.title2)
                        Text(team.strDescriptionEN ?? "-")
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.all)
                    }
                }
                .navigationTitle(team.strTeam)
            }
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
