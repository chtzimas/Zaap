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
    var body: Data? { get }
    var contentType: String { get }
}

extension ApiConvertor {
    var contentType: String {
        HeaderContentType.applicationJson.rawValue
    }
    
    func encode<T: Encodable>(_ data: T) -> Data? {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        var encoded: Data?
        do {
            encoded = try encoder.encode(data)
        } catch {
            print(ApiError.encoding.errorDescription ?? "")
        }
        return encoded
    }
    
    func decode<T: Decodable>(_ data: Data) -> T? {
        var decoded: T?
        do {
            decoded = try JSONDecoder().decode(T.self, from: data)
        } catch {
            print(ApiError.decoding.errorDescription ?? "")
        }
        return decoded
    }
}
