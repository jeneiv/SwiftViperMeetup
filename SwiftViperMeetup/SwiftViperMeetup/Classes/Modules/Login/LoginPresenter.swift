//
//  LoginPresenter.swift
//  SwiftViperMeetup
//
//  Created by Viktor Jenei on 15/06/15.
//  Copyright (c) 2015 com.victo. All rights reserved.
//

import Foundation

protocol LoginEventHandler : class {
    
}

class LoginPresenter : LoginEventHandler {
    weak var loginView : LoginView?
    
    init(view : LoginView) {
        loginView = view
    }
}
