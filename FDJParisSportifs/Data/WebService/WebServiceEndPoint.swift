//
//  WebServiceEndPoint.swift
//  FDJParisSportifs
//
//  Created by Cedrik on 08/01/2023.
//

import Foundation

enum WebServiceEndPoint: String {
    case allLeagues = "all_leagues.php"
    case allLeagueTeams = "search_all_teams.php?l="
    case teamInformations = "searchteams.php?t="
}
