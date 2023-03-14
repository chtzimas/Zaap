//
//  SignUpError.swift
//  Zaap
//
//  Created by Christos Tzimas on 20/1/23.
//

import Foundation

struct SignUpError: ApiErrorProtocol, Decodable {
    let message: String?
    
    public var errorDescription: String? {
        message
    }
}

extension SignUpError {
    enum CodingKeys: String, CodingKey {
        case message = "message"
    }
}
