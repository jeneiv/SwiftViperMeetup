//
//  LoginWireFrame.swift
//  SwiftViperMeetup
//
//  Created by Viktor Jenei on 15/06/15.
//  Copyright (c) 2015 com.victo. All rights reserved.
//

import Foundation
import UIKit

protocol LoginRouter : class {
    func presentLandingScreen(user : User)
    func presentForgottenPasswordScreen()
}

class LoginWireFrame : LoginRouter {
    private var loginView : LoginViewController
    private var loginPresenter : LoginPresenter
    
    init() {
        loginView = LoginViewController.loginView()
        loginPresenter = LoginPresenter(view: loginView)
        loginPresenter.loginWireFrame = self
        loginView.loginPresenter = loginPresenter
    }
    
    func viewController() -> UIViewController {
        return loginView
    }
}

extension LoginWireFrame {
    func presentLandingScreen(user : User) {
        println("presenting landing screen for \(user.name)")
    }
    
    func presentForgottenPasswordScreen() {
        println("presenting forgotten password screen")
    }
}