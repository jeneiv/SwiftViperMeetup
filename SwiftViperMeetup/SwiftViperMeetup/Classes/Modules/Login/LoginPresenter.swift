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
    weak var loginWireFrame : LoginRouter?
    weak var loginView : LoginView?
    lazy var loginService = LoginService()
    
    init(view : LoginView) {
        loginView = view
    }
    
    func handleLogin(userName : String, password : String) {
        println("Trying to log in with un: \(userName), pw: \(password)")
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), { [weak self] () -> Void in
            let loginService = LoginService()
            loginService.login(userName: userName, password: password, completion: { (user) -> () in
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    if let user = user {
                        self?.loginWireFrame?.presentLandingScreen(user)
                    }
                    else {
                        self?.loginView?.displayLoginError()
                    }
                })
            })
        })
    }
    
    func handleForgottenPassword() {
        loginWireFrame?.presentForgottenPasswordScreen()
    }
}
