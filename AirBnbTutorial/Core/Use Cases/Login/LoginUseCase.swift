//
//  LoginUseCase.swift
//  AirBnbTutorial
//
//  Created by Joffrey Mann on 9/12/24.
//

import Foundation
import Combine

class LoginUseCase {
    let repository: Postable
    
    init(repository: Postable) {
        self.repository = repository
    }
    
    func login<T: Decodable>(request: URLRequest, type: T.Type = LoginResponse.self) -> Future<T, ABError> where T: LoginResponse  {
        return repository.post(request: request, forType: type)
    }
}
