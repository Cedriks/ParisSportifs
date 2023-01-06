//
//  Result.swift
//  FDJParisSportifs
//
//  Created by Cedrik on 06/01/2023.
//

import Foundation

struct Result: Codable {
    let leagues: [League]
}
struct League: Codable {
   let idLeague: String
   let strLeague: String?
   let strSport: String?
   let strLeagueAlternate: String?
    
    static var example: League = League(idLeague: "12345", strLeague: "strLeague", strSport: "strSport", strLeagueAlternate: "strLeagueAlternate")
}
