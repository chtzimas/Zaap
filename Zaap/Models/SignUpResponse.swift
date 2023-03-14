//
//  SignUpResponse.swift
//  Zaap
//
//  Created by Christos Tzimas on 26/8/22.
//

import Foundation

struct SignUpResponse: Decodable {
    let user: User?
    
    init(user: User?) {
        self.user = user
    }
}

extension SignUpResponse {
    enum CodingKeys: String, CodingKey {
        case user = "user"
    }
}
