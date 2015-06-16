//
//  LoginPresenter.swift
//  SwiftViperMeetup
//
//  Created by Viktor Jenei on 15/06/15.
//  Copyright (c) 2015 com.victo. All rights reserved.
//

import Foundation

protocol LoginEventHandler : class {
    func handleLogin(userName : String, password : String)
    func handleForgottenPassword()
}

class LoginPresenter : LoginEventHandler {
    weak var loginView : LoginView?
    lazy var loginService = LoginService()
    
    init(view : LoginView) {
        loginView = view
    }
    
    func handleLogin(userName : String, password : String) {
        println("Trying to log in with un: \(userName), pw: \(password)")
    }
    
    func handleForgottenPassword() {
        println("Forgotten Password Event")
    }
}
