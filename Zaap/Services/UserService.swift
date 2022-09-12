//
//  UserService.swift
//  Zaap
//
//  Created by Christos Tzimas on 23/8/22.
//

import Foundation

class UserService {
    private var userWebRepository: UserWebRepository

    init(userWebRepository: UserWebRepository) {
        self.userWebRepository = userWebRepository
    }
    
    func createUser(with credentials: [String: String]) async throws -> User {
       try await userWebRepository.createUser(with: credentials)
    }
}
