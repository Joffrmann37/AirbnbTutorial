//
//  SignUpUseCase.swift
//  AirBnbTutorial
//
//  Created by Joffrey Mann on 9/12/24.
//

import Foundation
import Combine

class SignUpUseCase {
    let repository: Postable
    
    init(repository: Postable) {
        self.repository = repository
    }
    
    func signup<T: Decodable>(request: URLRequest, type: T.Type = SignupResponse.self) -> Future<T, ABError> where T: SignupResponse  {
        return repository.post(request: request, forType: type)
    }
}
