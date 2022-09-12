//
//  ApiError.swift
//  Zaap
//
//  Created by Christos Tzimas on 26/8/22.
//

import Foundation

enum ApiError: Error {
    case invalidUrl
    case encodingError
    case decodingError
    case errorCode(Int)
    case unknown
}

extension ApiError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidUrl:
            return "The API endpoint url is invalid"
        case .encodingError:
            return "Failed to encode the data to send to the API"
        case .decodingError:
            return "Failed to decode the data received from the API"
        case .errorCode(let code):
            return "\(code) - error code from API"
        case .unknown:
            return "Unkwown error"
        }
    }
}
