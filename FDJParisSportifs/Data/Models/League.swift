//
//  League.swift
//  FDJParisSportifs
//
//  Created by Cedrik on 08/01/2023.
//

import Foundation

struct League: Codable {
    let idLeague: String
    let strLeague: String?
    let strSport: String?
    let strLeagueAlternate: String?
    
    static var example: League = League(idLeague: "12345",
                                        strLeague: "strLeague",
                                        strSport: "strSport",
                                        strLeagueAlternate: "strLeagueAlternate")
}
