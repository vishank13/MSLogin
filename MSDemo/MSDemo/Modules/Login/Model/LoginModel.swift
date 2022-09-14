//
//  LoginModel.swift
//  MSDemo
//
//  Created by Vishank Raghav on 9/14/22.
//

import Foundation

struct LoginAPIResponse: Codable {
    let name, email: String?
    let contactNumber: Int?
}
