//
//  User.swift
//  Zaap
//
//  Created by Christos Tzimas on 25/8/22.
//

import Foundation

struct User: Codable, Equatable {
    let email: String?
    let username: String?
    let password: String?
    
    init(email: String?, username: String?, password: String?) {
        self.email = email
        self.username = username
        self.password = password
    }
    
    static func == (lhs: User, rhs: User) -> Bool {
        lhs.email == rhs.email &&
        lhs.username == rhs.username &&
        lhs.password == rhs.password
    }
}

extension User {
    enum CodingKeys: String, CodingKey {
        case email = "email"
        case username = "username"
        case password = "password"
    }
}
