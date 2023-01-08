//
//  TeamDetailLoadedView.swift
//  FDJParisSportifs
//
//  Created by Cedrik on 08/01/2023.
//

import SwiftUI

struct TeamDetailLoadedView: View {
    var team: Team
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                AsyncImage(
                    url: URL(string: team.strTeamBadge!),
                    content:{ image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: UIScreen.main.bounds.height)
                            .opacity(0.15)
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
        }    }
}

struct TeamDetailLoadedView_Previews: PreviewProvider {
    static var previews: some View {
        TeamDetailLoadedView(team: .example)
    }
}
