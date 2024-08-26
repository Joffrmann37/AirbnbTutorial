//
//  FetchListingsUseCase.swift
//  AirBnbTutorial
//
//  Created by Joffrey Mann on 8/26/24.
//

import Foundation
import Combine

class FetchListingsUseCase {
    let repository: Serviceable
    
    init(repository: Serviceable) {
        self.repository = repository
    }
    
    func fetchItems<T: Decodable>(url: URL, type: T.Type = Root.self) -> Future<T, ABError> where T: Root  {
        return repository.fetch(url: url, forType: type)
    }
}
