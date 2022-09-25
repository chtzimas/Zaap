//
//  UserRespone.swift
//  Zaap
//
//  Created by Christos Tzimas on 26/8/22.
//

import Foundation

struct UserResponse: Decodable {
    let data: User
}

extension UserResponse {
    enum CodingKeys: String, CodingKey {
        case data = "user"
    }
}
