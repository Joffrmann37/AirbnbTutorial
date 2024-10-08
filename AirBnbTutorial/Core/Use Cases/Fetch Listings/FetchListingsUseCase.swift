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
