//
//  SignUpRequest.swift
//  Zaap
//
//  Created by Christos Tzimas on 14/3/23.
//

import Foundation

struct SignUpRequest: Encodable {
    let user: User
    
    init(user: User) {
        self.user = user
    }
}


extension SignUpRequest {
    enum CodingKeys: String, CodingKey {
        case user = "user"
    }
}
