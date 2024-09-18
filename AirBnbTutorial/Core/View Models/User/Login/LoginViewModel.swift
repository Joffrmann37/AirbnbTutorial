//
//  LoginViewModel.swift
//  AirBnbTutorial
//
//  Created by Joffrey Mann on 9/12/24.
//

import Foundation
import Combine

@Observable
class LoginViewModel {
    var useCase: LoginUseCase
    private var subscriptions = Set<AnyCancellable>()
    var response: LoginResponse?
    var error: ABError?
    var userRequest: UserRequest?
    var isLoggedIn = false
    
    init(useCase: LoginUseCase, subscriptions: Set<AnyCancellable> = Set<AnyCancellable>(), userRequest: UserRequest? = nil) {
        self.useCase = useCase
        self.subscriptions = subscriptions
        self.userRequest = userRequest
    }
    
    func login<T>(type: T.Type = LoginResponse.self, request: URLRequest) where T: LoginResponse {
        useCase.login(request: request).sink { [unowned self] completion in
            if case let .failure(error) = completion {
                print(error.localizedDescription)
                self.error = error
            }
        } receiveValue: { [weak self] root in
            guard let self = self else { return }
            self.response = root
            UserViewModel.shared.accessToken = root.accessToken
            UserViewModel.shared.isLoggedIn = true
        }.store(in: &subscriptions)
    }
}
