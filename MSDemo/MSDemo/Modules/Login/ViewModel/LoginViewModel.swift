//
//  LoginViewModel.swift
//  MSDemo
//
//  Created by Vishank Raghav on 9/14/22.
//

import Foundation

class LoginViewModel {
    
    func loginWith(username: String, andPassword password: String, completion: (Bool, LoginAPIResponse?)-> Void) {
        if username.lowercased() == AppConstants.username && password == AppConstants.password {
            Helper.parseJson(of: LoginAPIResponse.self, from: AppConstants.userFileName) { data in
                completion(true, data)
            }
        } else {
            completion(false, nil)
        }
    }
    
}
