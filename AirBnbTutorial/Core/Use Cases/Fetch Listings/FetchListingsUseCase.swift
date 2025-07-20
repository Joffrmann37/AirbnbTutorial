//
//  FetchListingsUseCase.swift
//  AirBnbTutorial
//
//  Created by Joffrey Mann on 8/26/24.
//

import Foundation
import Combine

class FetchListingsUseCase {
    let repository: Fetchable
    
    init(repository: Fetchable) {
        self.repository = repository
    }
    
    func fetchItems<T: Decodable>(request: URLRequest, type: T.Type = Root.self) -> Future<T, ABError> where T: Root  {
        return repository.fetch(request: request, forType: type)
    }
}

// Core/Use Cases/Fetch Listings/FetchListingsUseCase.swift
extension FetchListingsUseCase: ListingLoading {
    func fetchListings(token: String) -> AnyPublisher<[Listing], ABError> {
        guard let request = RequestGenerator.createRequest(
            urlStr: "http://127.0.0.1:8000/listings",
            token: token,
            body: nil,
            contentType: "application/json; charset=utf-8"
        ) else {
            return Fail(error: ABError.badRequest).eraseToAnyPublisher()
        }
        
        return fetchItems(request: request)
            .map { $0.listings }
            .eraseToAnyPublisher()
    }
    
    func fetchListingsPublish(token: String) -> AnyPublisher<[Listing], ABError> {
            guard let request = RequestGenerator.createRequest(
                urlStr: "http://127.0.0.1:8000/listings",
                token: token,
                body: nil,
                contentType: "application/json; charset=utf-8"
            ) else {
                return Fail(error: ABError.badRequest).eraseToAnyPublisher()
            }
            
            return fetchItems(request: request)
                .map { $0.listings }
                .eraseToAnyPublisher()
        }
}

