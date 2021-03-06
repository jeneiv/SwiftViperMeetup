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
    func displayLoginError()
}

class LoginViewController : UIViewController, LoginView {
    weak var loginPresenter : LoginEventHandler?
    
    @IBOutlet weak var userNameTextField : UITextField?
    @IBOutlet weak var passwordTextField : UITextField?
    @IBOutlet weak var loginErrorMessageLabel : UIView?
    @IBOutlet weak var loadingOverlayView : UIView?
    
    @IBAction func loginButtonPressed(sender : UIButton) {
        loginErrorMessageLabel?.hidden = true
        loadingOverlayView?.hidden = false
        loginPresenter!.handleLogin(userNameTextField!.text, password: passwordTextField!.text)
    }
    
    @IBAction func textFieldEditingEnded(sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func forgottenPasswordButtonPressed(sender : UIButton) {
        loginPresenter!.handleForgottenPassword()
    }
    
    func displayLoginError() {
        loadingOverlayView?.hidden = true
        loginErrorMessageLabel?.hidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Login"
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        loginErrorMessageLabel?.hidden = true
        loadingOverlayView?.hidden = true
    }
    
}

extension LoginViewController {
    static func loginView() -> LoginViewController {
        let storyBoard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let viewController = storyBoard.instantiateViewControllerWithIdentifier("LoginView") as! LoginViewController
        return viewController
    }
}

extension LoginViewController : UITextFieldDelegate {
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}