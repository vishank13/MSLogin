//
//  LoginUnitTest.swift
//  MSDemoTests
//
//  Created by Vishank Raghav on 9/14/22.
//

import XCTest
@testable import MSDemo
class LoginUnitTest: XCTestCase {

    var sut: LoginViewModel?
    override func setUp() {
        super.setUp()
        sut = LoginViewModel()
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }

    func testLoginWithInValidCredentials() {
        sut?.loginWith(username: "Demo", andPassword: "Demo") { success, response in
            XCTAssertFalse(success)
        }
    }
    
    func testLoginWithValidCredentials() {
        sut?.loginWith(username: "Test", andPassword: "Test123") { success, response in
            XCTAssertTrue(success)
        }
    }
    
    func testInValidUsername() {
        XCTAssertFalse(Helper().validUsername(username: ""))
    }
    
    func testValidUsername() {
        XCTAssertTrue(Helper().validUsername(username: "Demo"))
    }
    
    func testInValidPassword() {
        XCTAssertFalse(Helper().validPassword(password: ""))
    }
    
    func testValidPassword() {
        XCTAssertTrue(Helper().validPassword(password: "Demo"))
    }
}
