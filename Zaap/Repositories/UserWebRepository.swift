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
        
        do {
            request.httpBody = try convertor.encode(credentials)
        } catch {
            throw ApiError.encodingError
        }
        
        let (data, response) = try await urlSession.data(for: request)
        guard let response = (response as? HTTPURLResponse) else {
            throw ApiError.unknown
        }
        
        let statusCode = response.statusCode
        if statusCode != 201 {
            throw ApiError.errorCode(statusCode)
        }
        
        let userResponse: UserResponse
        do {
            userResponse = try convertor.decode(data)
            return userResponse.data
        } catch {
            throw ApiError.decodingError
        }
    }
    
    func getUsers() {
        
    }
}
