//
//  LoginRepository.swift
//  AirBnbTutorial
//
//  Created by Joffrey Mann on 9/12/24.
//

import Foundation
import Combine

class LoginRepository {
    var subscriptions = Set<AnyCancellable>()
}

extension LoginRepository: Postable {
    func post<T>(request: URLRequest, forType type: T.Type) -> Future<T, ABError> where T : Decodable {
        return Future<T, ABError> { [unowned self] promise in
            URLSession(configuration: .default).dataTaskPublisher(for: request)
                .tryMap { (data: Data, response: URLResponse) in
                    if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode < 200 || httpResponse.statusCode > 299 {
                        if let error = ABError(rawValue: httpResponse.statusCode) {
                            promise(.failure(error))
                        }
                    }
                    return data
                }
                .decode(type: type,
                        decoder: JSONDecoder())
                .receive(on: RunLoop.main)
                .sink { completion in
                    if case let .failure(error) = completion, let error = error as? ABError {
                        promise(.failure(error))
                    }
                }
        receiveValue: {
            promise(.success($0))
        }
        .store(in: &self.subscriptions)
        }
    }
}
