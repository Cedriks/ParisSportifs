//
//  ContentViewModelSpec.swift
//  FDJParisSportifsTests
//
//  Created by Cedrik on 08/01/2023.
//

import XCTest
@testable import FDJParisSportifs

final class ContentViewModelSpec: XCTestCase {
    
    var viewModel: ContentView.ViewModel!
    var mockAllLeagues: MockAllLeaguesNetworker!
    
    @MainActor override func setUp() {
        mockAllLeagues = MockAllLeaguesNetworker()
        mockAllLeagues.stubbedLeague = [League(
            idLeague: "12345",
            strLeague: "strLeague",
            strSport: "strSport",
            strLeagueAlternate: "strLeagueAlternate"
        )]
        viewModel = ContentView.ViewModel(allLeaguesNetworker: mockAllLeagues)
    }
    
    @MainActor func testFectchingAllLeaguesToTrue() async {
        XCTAssertEqual(mockAllLeagues.invokedFetchAllLeaguesCount, 0)
        await viewModel.getAllLeagues()
        XCTAssertEqual(mockAllLeagues.invokedFetchAllLeaguesCount, 1)
        XCTAssertEqual(viewModel.leagues.first!.idLeague, mockAllLeagues.stubbedLeague.first!.idLeague)
    }
}
