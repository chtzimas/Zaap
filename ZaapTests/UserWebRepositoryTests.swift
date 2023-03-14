//
//  UserWebRepositoryTests.swift
//  ZaapTests
//
//  Created by Christos Tzimas on 5/3/23.
//

import XCTest
@testable import Zaap

class UserWebRepositoryTests: XCTestCase {
    private var sut = {
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration: configuration)
        return UserWebRepository(urlSession: urlSession)
    }()
    
    func testIfSignUpHitsTheCorrectEndpoint() async throws {
        let mockData = try JSONDecoder().decode(User.self, from: Bundle.stubbedDataFromJson(filename: "User"))
        let mockResponse = Bundle.stubbedDataFromJson(filename: "SignUpResponse")
        MockURLProtocol.requestHandler = { request in
            (HTTPURLResponse(), mockResponse)
        }
        
        try await sut.signUp(with: SignUpRequest(user: mockData))
        
        let request = try XCTUnwrap(MockURLProtocol.lastRequest)
        XCTAssertEqual(request.url?.absoluteString, Constants.Api.url + Constants.Api.Endpoints.user)
    }
    
    func testIfSignUpSendsTheCorrectData() async throws {
        let mockData = try JSONDecoder().decode(User.self, from: Bundle.stubbedDataFromJson(filename: "User"))
        let mockResponse = Bundle.stubbedDataFromJson(filename: "SignUpResponse")
        MockURLProtocol.requestHandler = { request in
            (HTTPURLResponse(), mockResponse)
        }
        
        try await sut.signUp(with: SignUpRequest(user: mockData))
        
        let request = try XCTUnwrap(MockURLProtocol.lastRequest)
        let body = try XCTUnwrap(request.httpBody)
        let response = try XCTUnwrap((try? JSONDecoder().decode(SignUpResponse.self, from: body)))
        let user = try XCTUnwrap(response.user)
        XCTAssertEqual(user.email, mockData.email)
        XCTAssertEqual(user.username, mockData.username)
        XCTAssertEqual(user.password, mockData.password)
    }
}
