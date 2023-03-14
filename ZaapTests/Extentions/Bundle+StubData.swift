//
//  Bundle+StubData.swift
//  ZaapTests
//
//  Created by Christos Tzimas on 5/3/23.
//

import Foundation
import XCTest

extension Bundle {
    static func stubbedDataFromJson(filename: String) -> Data {
        return stubbedData(filename: filename, withExtension: "json")
    }

    private static func stubbedData(filename: String, withExtension fileExtension: String) -> Data {
        guard let stubURL = Bundle(for: SignUpViewModelTests.self).url(forResource: filename, withExtension: fileExtension) else {
            XCTAssert(false, "\(filename).\(fileExtension) file not found")
            fatalError("file not found")
        }
        guard let stubData = try? Data(contentsOf: stubURL) else {
            XCTAssert(false, "\(filename).\(fileExtension) file cannot be read")
            fatalError("file cannot be read")
        }
        return stubData
    }
}
