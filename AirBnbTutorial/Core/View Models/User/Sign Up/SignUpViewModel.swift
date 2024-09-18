//
//  SignUpViewModel.swift
//  AirBnbTutorial
//
//  Created by Joffrey Mann on 9/12/24.
//

import Foundation
import Combine

@Observable
class SignUpViewModel {
    var useCase: SignUpUseCase
    private var subscriptions = Set<AnyCancellable>()
    var response: SignupResponse?
    var error: ABError?
    
    init(useCase: SignUpUseCase, subscriptions: Set<AnyCancellable> = Set<AnyCancellable>()) {
        self.useCase = useCase
        self.subscriptions = subscriptions
    }
    
    func signup<T>(type: T.Type = SignupResponse.self, request: URLRequest) where T: SignupResponse {
        useCase.signup(request: request).sink { [unowned self] completion in
            if case let .failure(error) = completion {
                self.error = error
            }
        } receiveValue: { [weak self] root in
            guard let self = self else { return }
            self.response = root
        }.store(in: &subscriptions)
    }
}
