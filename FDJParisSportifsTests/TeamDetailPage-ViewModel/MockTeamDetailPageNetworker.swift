//
//  MockTeamDetailPageNetworker.swift
//  FDJParisSportifsTests
//
//  Created by Cedrik on 09/01/2023.
//

import Foundation
@testable import FDJParisSportifs

final class MockTeamInformationNetworker: TeamInformationNetworking {

    var stubbedTeam: Team!
    var strTeam: String!
    
    func fetchTeamInformation(strTeam: String) async throws -> Team {
        stubbedTeam
    }
}
