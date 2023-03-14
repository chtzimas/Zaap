//
//  UserApiConvertor.swift
//  Zaap
//
//  Created by Christos Tzimas on 12/9/22.
//

import Foundation

enum UserApiConvertor: ApiConvertor {
    case signUp(request: SignUpRequest)
    case getUsers
    case getUserById(id: UUID)
    case updateUserById(id: UUID)
    case deleteUserById(id: UUID)
    
    var path: String {
        let url = Constants.Api.url
        switch self {
        case .signUp:
            return url + Constants.Api.Endpoints.user
        case .getUsers:
            return url + Constants.Api.Endpoints.user
        case .getUserById(let id):
            return url + Constants.Api.Endpoints.user + "/\(id)"
        case .updateUserById(let id):
            return url + Constants.Api.Endpoints.user + "/\(id)"
        case .deleteUserById(let id):
            return url + Constants.Api.Endpoints.user + "/\(id)"
        }
    }
    
    var method: String {
        switch self {
        case .signUp:
            return HttpMethods.post.rawValue
        case .updateUserById:
            return HttpMethods.put.rawValue
        case .deleteUserById:
            return HttpMethods.delete.rawValue
        default:
            return HttpMethods.get.rawValue
        }
    }
    
    var body: Data? {
        switch self {
        case .signUp(let signUpRequest):
            return encode(signUpRequest)
        default:
            return nil
        }
    }
}
