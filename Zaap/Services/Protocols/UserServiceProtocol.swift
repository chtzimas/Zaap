//
//  UserServiceProtocol.swift
//  Zaap
//
//  Created by Christos Tzimas on 5/3/23.
//

import Combine
import Foundation

protocol UserServiceProtocol {
    func signUp(with request: SignUpRequest) async throws
}
