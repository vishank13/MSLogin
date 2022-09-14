//
//  Helper.swift
//  MSDemo
//
//  Created by Vishank Raghav on 9/14/22.
//

import Foundation

class Helper {
    
    static func validUsername(username: String) -> Bool {
        return !username.isEmpty
    }
    
    static func validPassword(password: String) -> Bool {
        return !password.isEmpty
    }
    
    static func parseJson<T: Decodable>(of type: T.Type, from fileName: String, completion: (T)-> Void) {
        if let path = Bundle.main.path(forResource: fileName, ofType: "json") {
            let url = URL(fileURLWithPath: path)
            do {
                let jsonData = try Data(contentsOf: url)
                let decodedData: T = try JSONDecoder().decode(T.self, from: jsonData)
                completion(decodedData)
            }
            catch {
                print("Error: \(error)")
            }
        }
    }
}
