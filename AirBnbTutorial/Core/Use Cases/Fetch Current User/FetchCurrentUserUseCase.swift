//
//  FetchCurrentUserUseCase.swift
//  AirBnbTutorial
//
//  Created by Joffrey Mann on 9/12/24.
//

import Foundation
import Combine

class FetchCurrentUserUseCase {
    let repository: Fetchable
    
    init(repository: Fetchable) {
        self.repository = repository
    }
    
    func fetchCurrentUser<T: Decodable>(request: URLRequest, type: T.Type = User.self) -> Future<T, ABError> where T: User  {
        return repository.fetch(request: request, forType: type)
    }
}
