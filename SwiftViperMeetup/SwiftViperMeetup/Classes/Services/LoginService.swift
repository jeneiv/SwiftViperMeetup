//
//  LoginService.swift
//  SwiftViperMeetup
//
//  Created by Viktor Jenei on 15/06/15.
//  Copyright (c) 2015 com.victo. All rights reserved.
//

import Foundation

typealias LoginCompletion = (user : User?) -> ()


class LoginService {
    func login(#userName : String, password : String, completion : LoginCompletion) {
        var user : User? = Optional.None
        
        sleep(3)
        if userName == "frank" && password == "1234" {
            user = User(id: 1, name: "Frank")
        }
        
        completion(user: user)
    }
}