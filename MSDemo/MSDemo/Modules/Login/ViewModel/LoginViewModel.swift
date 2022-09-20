//
//  LoginViewModel.swift
//  MSDemo
//
//  Created by Vishank Raghav on 9/14/22.
//

import Foundation

class LoginViewModel {
    
    // ------------------------------
    // MARK: Login
    // ------------------------------
    func loginWith(username: String, andPassword password: String, completion: (Bool, LoginAPIResponse?)-> Void) {
        if username.lowercased() == AppConstants.username && password == AppConstants.password {
            Helper.parseJson(of: LoginAPIResponse.self, from: AppConstants.userFileName) { data in
                completion(true, data)
            }
        } else {
            completion(false, nil)
        }
    }
    
    // ------------------------------
    // MARK: Data Validation
    // ------------------------------
    func validUsername(_ username: String) -> Bool {
        return Helper.validUsername(username: username)
    }
    
    func validPassword(_ password: String) -> Bool {
        return Helper.validPassword(password: password)
    }
}
