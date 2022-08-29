//
//  NavigatorUITests.swift
//  NavigatorUITests
//
//  Created by hassan uriostegui on 8/28/22.
//

import XCTest

class NavigatorUITests: XCTestCase {
    let app = XCUIApplication()

    override func setUpWithError() throws {
        app.launch()
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {}

    func testTabs() throws {
        app/*@START_MENU_TOKEN@*/ .buttons["Tab Home"]/*[[".buttons[\"Home\"]",".buttons[\"Tab Home\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/ .tapSlow()
        let tabStoreButton = app/*@START_MENU_TOKEN@*/ .buttons["Tab Store"]/*[[".buttons[\"Store\"]",".buttons[\"Tab Store\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        tabStoreButton.tapSlow()

        let tabMeButton = app/*@START_MENU_TOKEN@*/ .buttons["Tab Me"]/*[[".buttons[\"Me\"]",".buttons[\"Tab Me\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        tabMeButton.tapSlow()

        let element = app.windows.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        element.tapSlow()
        element.tapSlow()
        tabMeButton.tapSlow()
        tabStoreButton.tapSlow()
        app/*@START_MENU_TOKEN@*/ .buttons["Tab Home"]/*[[".buttons[\"Home\"]",".buttons[\"Tab Home\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/ .tapSlow()
    }

    func testLinearNestedNav() {
        let app = XCUIApplication()
        app.launch()
        app/*@START_MENU_TOKEN@*/ .buttons["Tab Home"]/*[[".buttons[\"Home\"]",".buttons[\"Tab Home\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/ .tapSlow()
        let actionButtonButton = app/*@START_MENU_TOKEN@*/ .buttons["Action Button"]/*[[".buttons[\"Push Test Controller\"]",".buttons[\"Action Button\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        actionButtonButton.tapSlow()

        let nestedActionButtonButton = app/*@START_MENU_TOKEN@*/ .buttons["Nested Action Button"]/*[[".buttons[\"Push Test Controller Again\"]",".buttons[\"Nested Action Button\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        nestedActionButtonButton.tapSlow()
        nestedActionButtonButton.tapSlow()
        nestedActionButtonButton.tapSlow()
        nestedActionButtonButton.tapSlow()
        nestedActionButtonButton.tapSlow()

        let navigationBackButton = app/*@START_MENU_TOKEN@*/ .buttons["Navigation Back"]/*[[".buttons[\"chevron.left\"]",".buttons[\"Navigation Back\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        navigationBackButton.tapSlow()
        navigationBackButton.tapSlow()
        navigationBackButton.tapSlow()
        navigationBackButton.tapSlow()
        navigationBackButton.tapSlow()
        navigationBackButton.tapSlow()
        actionButtonButton.tapSlow()
        navigationBackButton.tapSlow()
        actionButtonButton.tapSlow()
        navigationBackButton.tapSlow()
    }

    func testSheetNestedNav() {
        let app = XCUIApplication()
        app.launch()
        app/*@START_MENU_TOKEN@*/ .buttons["Tab Home"]/*[[".buttons[\"Home\"]",".buttons[\"Tab Home\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/ .tapSlow()
        app/*@START_MENU_TOKEN@*/ .buttons["Tab Store"]/*[[".buttons[\"Store\"]",".buttons[\"Tab Store\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/ .tapSlow()

        let presentTestControllerButton = app.buttons["Present Test Controller"]
        presentTestControllerButton.tapSlow()

        let nestedActionButtonButton = app/*@START_MENU_TOKEN@*/ .buttons["Nested Action Button"]/*[[".buttons[\"Push Test Controller Again\"]",".buttons[\"Nested Action Button\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        nestedActionButtonButton.tapSlow()
        nestedActionButtonButton.tapSlow()

        let navigationBackButton = app/*@START_MENU_TOKEN@*/ .buttons["Navigation Back"]/*[[".buttons[\"chevron.left\"]",".buttons[\"Navigation Back\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        navigationBackButton.tapSlow()
        navigationBackButton.tapSlow()
        app/*@START_MENU_TOKEN@*/ .buttons["Navigation Back"]/*[[".buttons[\"xmark\"]",".buttons[\"Navigation Back\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/ .tapSlow()
        presentTestControllerButton.tapSlow()
        nestedActionButtonButton.tapSlow()
    }

    func testNonLinear() {
        let app = XCUIApplication()
        app.launch()
        let tabHomeButton = app/*@START_MENU_TOKEN@*/ .buttons["Tab Home"]/*[[".buttons[\"Home\"]",".buttons[\"Tab Home\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        tabHomeButton.tapSlow()
        app/*@START_MENU_TOKEN@*/ .buttons["Tab Store"]/*[[".buttons[\"Store\"]",".buttons[\"Tab Store\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/ .tapSlow()
        app.buttons["Present Test Controller"].tapSlow()
        app/*@START_MENU_TOKEN@*/ .buttons["Nested Action Button"]/*[[".buttons[\"Push Test Controller Again\"]",".buttons[\"Nested Action Button\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/ .tapSlow()
        app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element(boundBy: 0).swipeDown()
        tabHomeButton.tapSlow()
        app/*@START_MENU_TOKEN@*/ .buttons["Action Button"]/*[[".buttons[\"Push Test Controller\"]",".buttons[\"Action Button\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/ .tapSlow()
        app/*@START_MENU_TOKEN@*/ .buttons["Navigation Back"]/*[[".buttons[\"chevron.left\"]",".buttons[\"Navigation Back\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/ .tapSlow()
    }
}
