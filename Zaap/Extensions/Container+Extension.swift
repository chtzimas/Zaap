//
//  Container+Extension.swift
//  Zaap
//
//  Created by Christos Tzimas on 1/4/23.
//

import Factory
import Foundation

extension Container {
    var userService: Factory<UserService> {
        self {
            UserService(userWebRepository: self.userWebRepository())
        }.shared
    }
    
    var userWebRepository: Factory<UserWebRepository> {
        self {
            UserWebRepository(urlSession: .shared)
        }.shared
    }
}
