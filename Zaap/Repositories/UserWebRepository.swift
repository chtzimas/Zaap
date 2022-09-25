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
    
    func createUser(with credentials: [String: String]) async throws -> User {
        let convertor = UserApiConvertor.createUser
        guard let url = URL(string: convertor.path) else {
            throw ApiError.invalidUrl
        }
        
        let contentType = convertor.contentType
        var request = URLRequest(url: url)
        request.httpMethod = convertor.method
        request.addValue(contentType, forHTTPHeaderField: "Content-Type")
        request.addValue(contentType, forHTTPHeaderField: "Accept")
        request.httpBody = try convertor.encode(credentials)
        
        let (data, response) = try await urlSession.data(for: request)
        guard let response = (response as? HTTPURLResponse) else {
            throw ApiError.unknown
        }
        
        let statusCode = response.statusCode
        switch statusCode {
        case 201:
            let userResponse: UserResponse = try convertor.decode(data)
            return userResponse.data
        case 409:
            let error: UserError = try convertor.decode(data)
            throw error
        default:
            throw ApiError.unknown
        }
    }
    
    func getUsers() {
        
    }
}
