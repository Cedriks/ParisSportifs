//
//  FDJParisSportifsUITests.swift
//  FDJParisSportifsUITests
//
//  Created by Cedrik on 06/01/2023.
//

import XCTest
import SwiftUI


final class FDJParisSportifsUITests: XCTestCase {
    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()
    }
    
    func testShowTeamsList() throws {
        let app = XCUIApplication()
        app.launch()
        
        let leagueButtons = app.buttons["leagueNavigationLink"]
        leagueButtons.firstMatch.tap()
        closeVisibleScreen(app)
    }
    
    func testShowTeamInformations() throws {
        let app = XCUIApplication()
        app.launch()
        
        let leagueButtons = app.buttons["leagueNavigationLink"]
        leagueButtons.firstMatch.tap()
        
        let teamButtons = app.buttons["teamNavigationLink"]
        teamButtons.firstMatch.tap()
        
        closeVisibleScreen(app)
        closeVisibleScreen(app)
    }
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
    
    //MARK: - Tools
    func closeVisibleScreen(_ app: XCUIApplication) {
        app.navigationBars.buttons.element(boundBy: 0).tap()
    }
}
