//
//  ApiService.swift
//  Zaap
//
//  Created by Christos Tzimas on 23/8/22.
//

import Foundation

class ApiService{
    private var ApiRepository: ApiRepository

    init(ApiRepository: ApiRepository) {
        self.ApiRepository = ApiRepository
    }
    
    func createUser(with credentials: [String: String]) async throws -> User {
       try await ApiRepository.createUser(with: credentials)
    }
}
