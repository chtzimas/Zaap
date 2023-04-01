//
//  SignUpViewModelTests.swift
//  ZaapTests
//
//  Created by Christos Tzimas on 22/7/22.
//

import Factory
import XCTest
@testable import Zaap

class SignUpViewModelTests: XCTestCase {
    var sut: SignUpViewModel!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = SignUpViewModel(userService: Container.shared.userService())
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

    func testIfValidEmail() throws {
        let validEmail = "takhs@takaros.c"
        let invalidEmail = "ff.com"
        
        sut.email = validEmail
        XCTAssertTrue(sut.emailMeetsCriteria())
        
        sut.email = invalidEmail
        XCTAssertFalse(sut.emailMeetsCriteria())
    }
    
    func testIfValidUsername() throws {
        let validUsername = "takhs"
        let invalidUsername = ""

        sut.username = validUsername
        XCTAssertTrue(sut.usernameMeetsCriteria())
        
        sut.username = invalidUsername
        XCTAssertFalse(sut.usernameMeetsCriteria())
    }
    
    func testIfValidPassword() {
        let validPassword = "a1^kklmR"
        let invalidPassword = "ww1ww2"
        
        sut.password = validPassword
        XCTAssertTrue(sut.passwordMeetsCriteria())
        
        sut.password = invalidPassword
        XCTAssertFalse(sut.passwordMeetsCriteria())
    }
    
    func testIfValidVerifiedPassword() {
        let password = "a1^kklmR"
        let verifiedPassword = "a1^kklmR"
        let invalidVerifiedPassword = "lkase"
        
        sut.password = password
        sut.verifiedPassword = verifiedPassword
        XCTAssertTrue(sut.verifiedPasswordMeetsCriteria())
        
        sut.password = password
        sut.verifiedPassword = invalidVerifiedPassword
        XCTAssertFalse(sut.verifiedPasswordMeetsCriteria())
    }
    
    func testIfUserDetailsInputCleared() {
        sut.email = "lala"
        sut.username = "lala"
        sut.password = "lala"
        sut.verifiedPassword = "lala"
        
        sut.clearUserDetailsInput()
        
        XCTAssertTrue(sut.email.isEmpty)
        XCTAssertTrue(sut.username.isEmpty)
        XCTAssertTrue(sut.password.isEmpty)
        XCTAssertTrue(sut.verifiedPassword.isEmpty)
    }
}
