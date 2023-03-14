//
//  SignUpViewModelTests.swift
//  ZaapTests
//
//  Created by Christos Tzimas on 22/7/22.
//

import XCTest
@testable import Zaap

class SignUpViewModelTests: XCTestCase {
    var sut: SignUpViewModel!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = DependencyInjector.shared.resolve(type: SignUpViewModel.self)!
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
    
    func testIfUserCreatedAsRequested() async throws {
        let user = try! JSONDecoder().decode(User.self, from: Bundle.stubbedDataFromJson(filename: "User"))
        
        sut.email = user.email!
        sut.username = user.username!
        sut.password = user.password!
        await sut.signUp()
        
        try XCTSkipIf(sut.user == nil, "Something went wrong with the server communication.")
        XCTAssertEqual(sut.user, user, "The user created differs from the one that was requested")
    }
}