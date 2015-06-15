//
//  LoginView.swift
//  SwiftViperMeetup
//
//  Created by Viktor Jenei on 15/06/15.
//  Copyright (c) 2015 com.victo. All rights reserved.
//

import Foundation
import UIKit

protocol LoginView : class {
    weak var loginPresenter : LoginPresenter? {get set}
}

class LoginViewController : UIViewController, LoginView {
    weak var loginPresenter : LoginPresenter?
}
