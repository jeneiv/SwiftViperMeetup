//
//  UserProfileWireFrame.swift
//  SwiftViperMeetup
//
//  Created by Viktor Jenei on 22/06/15.
//  Copyright (c) 2015 com.victo. All rights reserved.
//

import Foundation
import UIKit

protocol UserProfileRouter : class {
    func dismissUserProfile()
    func viewController() -> UIViewController
}

class UserProfileWireFrame {
    private var userProfileView : UserProfileViewController
    private var userProfilePresenter : UserProfilePresenter
    
    init(user : User) {
        userProfileView = UserProfileViewController.userProfileView()
        userProfilePresenter = UserProfilePresenter(view: userProfileView, user : user)
        userProfilePresenter.userProfileWireFrame = self
        userProfileView.userProfilePresenter = userProfilePresenter
    }
    
    func viewController() -> UIViewController {
        return userProfileView
    }
    
}

extension UserProfileWireFrame : UserProfileRouter {
    func dismissUserProfile() {
        
    }
}