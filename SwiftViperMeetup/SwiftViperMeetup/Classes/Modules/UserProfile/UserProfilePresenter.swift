//
//  UserProfilePresenter.swift
//  SwiftViperMeetup
//
//  Created by Viktor Jenei on 22/06/15.
//  Copyright (c) 2015 com.victo. All rights reserved.
//

import Foundation

protocol UserProfileEventHandler : class {
    
}

class UserProfilePresenter {
    weak var userProfileWireFrame : UserProfileRouter?
    weak var userProfileView : UserProfileView?

    init(view : UserProfileView, user : User) {
        userProfileView = view
    }
}

extension UserProfilePresenter : UserProfileEventHandler {
    
}
