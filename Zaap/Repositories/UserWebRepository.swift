//
//  UserWebRepository.swift
//  Zaap
//
//  Created by Christos Tzimas on 23/8/22.
//

import Foundation
import SwiftUI

class UserWebRepository {
    private let urlSession: URLSession
    
    init(urlSession: URLSession) {
        self.urlSession = urlSession
    }
    
    func signUp(with request: SignUpRequest) async throws -> User? {
        let convertor = UserApiConvertor.signUp(request: request)
        guard let url = URL(string: convertor.path) else {
            throw ApiError.invalidUrl
        }
        
        let contentType = convertor.contentType
        var request = URLRequest(url: url)
        request.httpMethod = convertor.method
        request.addValue(contentType, forHTTPHeaderField: "Content-Type")
        request.addValue(contentType, forHTTPHeaderField: "Accept")
        request.httpBody = convertor.body
        
        let (data, response) = try await urlSession.data(for: request)
        guard let response = (response as? HTTPURLResponse) else {
            throw ApiError.unknown
        }
        
        let statusCode = response.statusCode
        switch statusCode {
        case 201:
            let response: SignUpResponse? = convertor.decode(data)
            return response?.user
        case 409:
            guard let error: SignUpError = convertor.decode(data) else {
                return nil
            }
            throw error
        default:
            throw ApiError.unknown
        }
    }
}
