//
//  FDJParisSportifsUITests.swift
//  FDJParisSportifsUITests
//
//  Created by Cedrik on 06/01/2023.
//

import XCTest
import SwiftUI


final class FDJParisSportifsUITests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()
    }
    
    func testShowTeamsList() throws {
        let app = XCUIApplication()
        app.launch()
        
        let leagueButtons = app.buttons["leagueNavigationLink"]
        leagueButtons.firstMatch.tap()
    }
    
    func testShowTeamInformations() throws {
        let app = XCUIApplication()
        app.launch()
        
        let leagueButtons = app.buttons["leagueNavigationLink"]
        leagueButtons.firstMatch.tap()
        
        let teamButtons = app.buttons["teamNavigationLink"]
        teamButtons.firstMatch.tap()
    }
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
