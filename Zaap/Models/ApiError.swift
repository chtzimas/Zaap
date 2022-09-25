//
//  ApiError.swift
//  Zaap
//
//  Created by Christos Tzimas on 26/8/22.
//

import Foundation

protocol ApiErrorProtocol: LocalizedError {}

enum ApiError: ApiErrorProtocol {
    case invalidUrl
    case encoding
    case decoding
    case unknown
    
    public var errorDescription: String? {
        switch self {
        case .invalidUrl:
            return "The API endpoint url is invalid."
        case .encoding:
            return "Failed to encode the data to send to the API."
        case .decoding:
            return "Failed to decode the data received from the API."
        case .unknown:
            return "Something went wrong. Please try again."
        }
    }
}

struct UserError: ApiErrorProtocol, Decodable {
    let message: String?
    
    public var errorDescription: String? {
        message
    }
}

extension UserError {
    enum CodingKeys: String, CodingKey {
        case message = "message"
    }
}
