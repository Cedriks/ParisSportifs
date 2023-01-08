//
//  TeamRow.swift
//  FDJParisSportifs
//
//  Created by Cedrik on 08/01/2023.
//

import SwiftUI

struct TeamRow: View {
    var team: Team
    
    var body: some View {
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
}

struct TeamRow_Previews: PreviewProvider {
    static var previews: some View {
        TeamRow(team: Team.example)
    }
}
