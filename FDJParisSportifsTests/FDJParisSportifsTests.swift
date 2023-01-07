//
//  FDJParisSportifsTests.swift
//  FDJParisSportifsTests
//
//  Created by Cedrik on 06/01/2023.
//

import XCTest
@testable import FDJParisSportifs

final class FDJParisSportifsTests: XCTestCase {

    func testUrlRequestGeneration() {
        let validationURL: URL = URL(string: "https://www.thesportsdb.com/api/v1/json/50130162/all_leagues.php")!
        let webService = WebService()
        var request: URL?
        do {
            request = try webService.createURLRequest(.allLeagues, nil)
        } catch {
            XCTFail()
        }
        XCTAssertEqual(request, validationURL)
    }
    
    func testReceptionTypeLeagues_API1() async {
        var leagues: Any?
        let webService = WebService()
        do {
            leagues = try await webService.fetchAllLeagues()
        } catch {
            XCTFail()
        }
        XCTAssert(leagues is [League])
    }

    func testReceptionTypeLeagueTeams_API2() async {
        var teams: Any?
        let webService = WebService()
        do {
            teams = try await webService.fetchAllLeagueTeams(strLeague: Team.example.strLeague! )
        } catch {
            XCTFail()
        }
        XCTAssert(teams is [Team])
    }
    
    func testReceptionTypeTeamInformations_API3() async {
        var team: Any?
        let webService = WebService()
        do {
            team = try await webService.fetchTeamInformations(strTeam: Team.example.strTeam )
        } catch {
            XCTFail()
        }
        XCTAssert(team is Team)
    }
}
