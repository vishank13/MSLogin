//
//  Extensions.swift
//  MSDemo
//
//  Created by Vishank Raghav on 9/14/22.
//

import Foundation

extension NSObject {
    class var className: String {
        return String(describing: self)
    }
}
