//
//  UserTests.swift
//  ZaapTests
//
//  Created by Christos Tzimas on 5/3/23.
//

@testable import Zaap
import XCTest

class UserTests: XCTest {
    func testLocalUserValid() {
        let jsonData = Bundle.stubbedDataFromJson(filename: "User")

        let decoder = JSONDecoder()
        do {
            let localUser = try decoder.decode(User.self, from: jsonData)
            XCTAssertEqual(localUser.email, "takaros13@takaros.com")
            XCTAssertEqual(localUser.username, "takaros")
            XCTAssertEqual(localUser.password, "a1^kklmR")
        } catch {
            XCTAssert(false, "User.json decode failed \(error)")
        }
    }
}
