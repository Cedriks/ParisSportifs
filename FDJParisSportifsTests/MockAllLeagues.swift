//
//  MockAllLeagues.swift
//  FDJParisSportifsTests
//
//  Created by Cedrik on 08/01/2023.
//

import Foundation
@testable import FDJParisSportifs

final class MockAllLeagues: AllLeaguesNetworking {
    
    var invokedFetchAllLeaguesCount = 0
    var stubbedLeague: [League]!
    
    func fetchAllLeagues() async throws -> [League] {
        invokedFetchAllLeaguesCount += 1
        return stubbedLeague
    }
}
