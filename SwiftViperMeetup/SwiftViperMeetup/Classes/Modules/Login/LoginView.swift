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
    weak var loginPresenter : LoginEventHandler? {get set}
}

class LoginViewController : UIViewController, LoginView {
    weak var loginPresenter : LoginEventHandler?
    
    @IBOutlet weak var userNameTextField : UITextField?
    @IBOutlet weak var passwordTextField : UITextField?
    
    @IBAction func loginButtonPressed(sender : UIButton) {
        println("Login Button Pressed")
        loginPresenter!.handleLogin(userNameTextField!.text, password: passwordTextField!.text)
    }
    
    @IBAction func forgottenPasswordButtonPressed(sender : UIButton) {
        println("Forgotten Password Button Pressed")
        loginPresenter!.handleForgottenPassword()
    }
    
    static func loginView() -> LoginViewController {
        let storyBoard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let viewController = storyBoard.instantiateViewControllerWithIdentifier("LoginView") as! LoginViewController
        return viewController
    }
}
