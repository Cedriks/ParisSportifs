//
//  LeagueRow.swift
//  FDJParisSportifs
//
//  Created by Cedrik on 08/01/2023.
//

import SwiftUI

struct LeagueRow: View {
    var league: League
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(league.strLeague ?? "-")
                .font(.headline)
            Text(league.strSport ?? "-")
                .italic()
                .font(.footnote)
        }
    }
}

struct LeagueRow_Previews: PreviewProvider {
    static var previews: some View {
        LeagueRow(league: League(
            idLeague: "12345",
            strLeague: "strLeague",
            strSport: "strSport",
            strLeagueAlternate: "strLeagueAlternate"
        ))
    }
}
