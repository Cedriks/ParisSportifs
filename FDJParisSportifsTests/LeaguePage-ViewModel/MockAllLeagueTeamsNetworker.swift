//
//  MockAllLeagueTeamsNetworking.swift
//  FDJParisSportifsTests
//
//  Created by Cedrik on 08/01/2023.
//

import Foundation
@testable import FDJParisSportifs

final class MockAllLeagueTeamsNetworker: AllLeagueTeamsNetworking {
    
    var invokedFetchAllLeagueTeamsCount = 0
    var stubbedTeam: [Team]!
    var stubbedLeague: League!
    
    func fetchAllLeagueTeams(strLeague: String) async throws -> [Team] {
        invokedFetchAllLeagueTeamsCount += 1
        return stubbedTeam
    }
}
