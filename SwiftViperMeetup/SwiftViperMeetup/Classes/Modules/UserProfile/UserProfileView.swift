//
//  UserProfileView.swift
//  SwiftViperMeetup
//
//  Created by Viktor Jenei on 22/06/15.
//  Copyright (c) 2015 com.victo. All rights reserved.
//

import Foundation
import UIKit

protocol UserProfileView : class {
    weak var userProfilePresenter : UserProfileEventHandler? {get set}
}

class UserProfileViewController : UIViewController, UserProfileView {
    weak var userProfilePresenter : UserProfileEventHandler?
}

extension UserProfileViewController {
    static func userProfileView() -> UserProfileViewController {
        let storyBoard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let viewController = storyBoard.instantiateViewControllerWithIdentifier("ProfileView") as! UserProfileViewController
        return viewController
    }
}
