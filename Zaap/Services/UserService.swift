//
//  UserService.swift
//  Zaap
//
//  Created by Christos Tzimas on 23/8/22.
//

import Combine
import Foundation

class UserService: UserServiceProtocol {
    private let userWebRepository: UserWebRepository

    init(userWebRepository: UserWebRepository) {
        self.userWebRepository = userWebRepository
    }
    
    func signUp(with request: SignUpRequest) async throws -> User? {
       try await userWebRepository.signUp(with: request)
    }
}
