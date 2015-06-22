//
//  User.swift
//  SwiftViperMeetup
//
//  Created by Viktor Jenei on 15/06/15.
//  Copyright (c) 2015 com.victo. All rights reserved.
//

import Foundation

class User {
    var id : Int
    var name : String
    var imageURL : NSURL?
    var address : String?
    
    init(id : Int, name : String) {
        self.id = id
        self.name = name
    }
}