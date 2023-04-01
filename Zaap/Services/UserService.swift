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
    private(set) var user: User?

    init(userWebRepository: UserWebRepository) {
        self.userWebRepository = userWebRepository
    }
    
    func signUp(with request: SignUpRequest) async throws {
       user = try await userWebRepository.signUp(with: request)
    }
}
