//
//  LoginServiceTest.swift
//  SwiftViperMeetup
//
//  Created by Viktor Jenei on 22/06/15.
//  Copyright (c) 2015 com.victo. All rights reserved.
//

import UIKit
import XCTest

class LoginServiceTest: XCTestCase {
    var loginService : LoginService?

    override func setUp() {
        super.setUp()

        loginService = LoginService()
    }
    
    func testLoginFail() {
        loginService!.login(userName: "dsfdsfd", password: "fdsfdsf") { (user) -> () in
            XCTAssertNil(user, "User should be nil")
        }
    }

    func testLoginSuccess() {
        loginService!.login(userName: "frank", password: "1234") { (user) -> () in
            XCTAssertNotNil(user, "I Miss Frank!")
            XCTAssertTrue(user?.id == 1, "Frank's id should be 1")
        }
    }
}
