//
//  ApiRepository.swift
//  Zaap
//
//  Created by Christos Tzimas on 23/8/22.
//

import Foundation
import SwiftUI

class ApiRepository {
    private let urlSession: URLSession
    
    init(urlSession: URLSession) {
        self.urlSession = urlSession
    }
    
    func createUser(with credentials: [String: String]) async throws -> User {
        let endpoint = Constants.Api.url + Constants.Api.Routes.user
        guard let url = URL(string: endpoint) else {
            throw ApiError.invalidUrl
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: credentials, options: .prettyPrinted)
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
        let userResponde: UserResponse
        do {
            userResponde = try JSONDecoder().decode(UserResponse.self, from: data)
            return userResponde.data
        } catch {
            throw ApiError.decodingError
        }
    }
    
    func getUsers() {
        
    }
}
