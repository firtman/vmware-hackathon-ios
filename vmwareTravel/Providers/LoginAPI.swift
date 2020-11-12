//
//  API.swift
//  vmwareTravel
//
//

import Foundation

class LoginAPI {
    
    
    func login(user: String, password: String, callback: (Bool)->Void) {
        // This is a Dummy API to login a user
        if user=="vmware" && password=="123456" {
            callback(true)
        } else {
            callback(false)
        }
    }
    
    
}
