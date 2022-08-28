//
//  ApiRepository.swift
//  Zaap
//
//  Created by Christos Tzimas on 23/8/22.
//

import Combine
import Foundation

class ApiRepository {
    private let urlSession: URLSession
    
    init(urlSession: URLSession) {
        self.urlSession = urlSession
    }
    
    func createUser(with credentials: [String: String]) -> AnyPublisher<User, ApiError> {
        let endpoint = Constants.Api.endpoint + Constants.Api.Routes.user
        let url = URL(string: endpoint)!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: credentials, options: .prettyPrinted)
          } catch {
              return Fail(error: ApiError.decodingError).eraseToAnyPublisher()
          }
        
        return urlSession
            .dataTaskPublisher(for: request)
            .receive(on: DispatchQueue.main)
            .mapError { error in
                ApiError.errorCode(error.errorCode)
            }
            .flatMap { data, response -> AnyPublisher<User, ApiError> in
                guard let response = response as? HTTPURLResponse else {
                    return Fail(error: ApiError.unknown).eraseToAnyPublisher()
                }
                if response.statusCode == 201 {
                    return Just(data)
                        .decode(type: UserResponse.self, decoder: JSONDecoder())
                        .mapError { _ in
                            return ApiError.decodingError
                        }
                        .map { $0.data }
                        .eraseToAnyPublisher()
                } else {
                    return Fail(error: ApiError.errorCode(response.statusCode)).eraseToAnyPublisher()
                }
            }
            .eraseToAnyPublisher()
        
        func getUsers() {
            
        }
    }
}
