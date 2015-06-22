//
//  LoginPresenterTest.swift
//  SwiftViperMeetup
//
//  Created by Viktor Jenei on 22/06/15.
//  Copyright (c) 2015 com.victo. All rights reserved.
//

import UIKit
import XCTest

class LoginPresenterTest: XCTestCase {
    var presenter : LoginPresenter?
    var view : MockView?
    var wireFrame : MockWireFrame?

    override func setUp() {
        super.setUp()
        
        view = MockView()
        presenter = LoginPresenter(view: view!)
    }
    
    func testForgottenPasswordEvent() {
        wireFrame = MockWireFrame()
        
        presenter!.loginWireFrame = wireFrame
        presenter!.handleForgottenPassword()
        
        XCTAssertTrue(wireFrame!.presentForgottenPasswordCalled, "Forgotten Password Presentation wasn't called")
    }
    
    func testLandingScreenPresentationEvent() {
        wireFrame = MockWireFrame()
        wireFrame!.expectation = expectationWithDescription("Landing Screen Presentation Expectation")
        
        presenter!.loginWireFrame = wireFrame
        presenter!.handleLogin("frank", password: "1234")
        
        waitForExpectationsWithTimeout(4, handler: nil)
    }
    
    func testLoginError() {
        view!.expectation = expectationWithDescription("Login Error Expectation")

        presenter!.loginWireFrame = wireFrame
        presenter!.handleLogin("not frank", password: "not 1234")
        
        waitForExpectationsWithTimeout(4, handler: nil)
    }

}

extension LoginPresenterTest {
    class MockView : LoginView {
        weak var loginPresenter : LoginEventHandler?
        var expectation : XCTestExpectation?
        
        func displayLoginError() {
            expectation?.fulfill()
        }
    }
    
    class MockWireFrame : LoginRouter {
        var presentLandingScreenCalled = false
        var presentForgottenPasswordCalled = false
        var expectation : XCTestExpectation?

        func presentLandingScreen(user : User) {
            expectation?.fulfill()
        }
        
        func presentForgottenPasswordScreen() {
            presentForgottenPasswordCalled = true
        }
    }

}