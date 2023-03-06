//
//  UserRespone.swift
//  Zaap
//
//  Created by Christos Tzimas on 26/8/22.
//

import Foundation

struct UserResponse: Decodable {
    let user: User?
    
    init(user: User?) {
        self.user = user
    }
}

extension UserResponse {
    enum CodingKeys: String, CodingKey {
        case user = "user"
    }
}
