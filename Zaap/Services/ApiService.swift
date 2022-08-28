//
//  ApiService.swift
//  Zaap
//
//  Created by Christos Tzimas on 23/8/22.
//

import Combine
import Foundation

class ApiService{
    private var ApiRepository: ApiRepository

    init(ApiRepository: ApiRepository) {
        self.ApiRepository = ApiRepository
    }
    
    func createUser(with credentials: [String: String]) -> AnyPublisher<User, ApiError> {
        ApiRepository.createUser(with: credentials)
    }
}
