//
//  ListingsRepository.swift
//  AirBnbTutorial
//
//  Created by Joffrey Mann on 8/26/24.
//

import Foundation
import Combine

enum ABError: Int, Swift.Error {
    case badRequest = 400
    case forbidden = 403
    case notFound = 404
    case serverError = 500
    case notAcceptable = 406
}

protocol Serviceable {
    func fetch<T>(url: URL, forType type: T.Type) -> Future<T, ABError> where T : Decodable
}

class ListingsRepository {
    var subscriptions = Set<AnyCancellable>()
}

extension ListingsRepository: Serviceable {
    func fetch<T>(url: URL, forType type: T.Type) -> Future<T, ABError> where T : Decodable {
        return Future<T, ABError> { [unowned self] promise in
            URLSession(configuration: .default).dataTaskPublisher(for: url)
                .tryMap { (data: Data, response: URLResponse) in
                    if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode < 200 || httpResponse.statusCode > 299 {
                        throw ABError(rawValue: httpResponse.statusCode)!
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
