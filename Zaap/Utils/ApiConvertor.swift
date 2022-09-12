//
//  ApiConvertor.swift
//  Zaap
//
//  Created by Christos Tzimas on 12/9/22.
//

import Foundation

enum HttpMethods: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

enum HeaderContentType: String {
    case applicationJson = "application/json"
}

protocol ApiConvertor {
    var path: String { get }
    var method: String { get }
    var contentType: String { get }
}

extension ApiConvertor {
    var contentType: String {
        HeaderContentType.applicationJson.rawValue
    }
    
    func encode<T: Encodable>(_ data: T) throws -> Data {
        return try JSONSerialization.data(withJSONObject: data, options: .prettyPrinted)
    }
    
    func decode<T: Decodable>(_ data: Data) throws -> T {
        return try JSONDecoder().decode(T.self, from: data)
    }
}
