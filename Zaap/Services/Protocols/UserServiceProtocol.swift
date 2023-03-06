//
//  UserServiceProtocol.swift
//  Zaap
//
//  Created by Christos Tzimas on 5/3/23.
//

import Combine
import Foundation

protocol UserServiceProtocol {
    func createUser(_ user: User) async throws -> User?
}
