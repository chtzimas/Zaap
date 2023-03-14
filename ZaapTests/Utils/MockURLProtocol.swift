//
//  MockURLProtocol.swift
//  ZaapTests
//
//  Created by Christos Tzimas on 7/3/23.
//

import Foundation
import XCTest

class MockURLProtocol: URLProtocol {
    static var requestHandler: ((URLRequest) -> (HTTPURLResponse, Data))?
    static var lastRequest: URLRequest?
    
    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    override func startLoading() {
        guard let handler = MockURLProtocol.requestHandler else {
            XCTFail("Received unexpected request with no handler set")
            return
        }
        let (response, data) = handler(request)
        client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
        client?.urlProtocol(self, didLoad: data)
        client?.urlProtocolDidFinishLoading(self)
        var request = request
        request.httpBody = data
        Self.lastRequest = request
    }
    
    override func stopLoading() {
    }
}
