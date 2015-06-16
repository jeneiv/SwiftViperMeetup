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
}

class LoginWireFrame : LoginRouter {
    private var loginView : LoginViewController
    private var loginPresenter : LoginPresenter
    
    init() {
        loginView = LoginViewController.loginView()
        loginPresenter = LoginPresenter(view: loginView)
        loginView.loginPresenter = loginPresenter
    }
    
    func viewController() -> UIViewController {
        return loginView
    }
}