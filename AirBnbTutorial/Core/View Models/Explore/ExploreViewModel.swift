//
//  ListingsViewModel.swift
//  AirBnbTutorial
//
//  Created by Joffrey Mann on 8/26/24.
//

import Foundation
import Combine

@Observable
class ExploreViewModel {
    var useCase: FetchListingsUseCase
    private var subscriptions = Set<AnyCancellable>()
    var url: URL = URL(string: "http://127.0.0.1:8000/listings")!
    var items = [Listing]()
    var error: ABError?
    
    init(useCase: FetchListingsUseCase, subscriptions: Set<AnyCancellable> = Set<AnyCancellable>(), url: URL) {
        self.useCase = useCase
        self.subscriptions = subscriptions
        self.url = url
    }
    
    func fetchItems<T>(type: T.Type = Root.self, token: String) where T: Root {
        guard let request = RequestGenerator.createRequest(urlStr: "http://127.0.0.1:8000/listings", token: token, body: nil, contentType: "application/json; charset=utf-8") else {
            return
        }
        useCase.fetchItems(request: request).sink { [unowned self] completion in
            if case let .failure(error) = completion {
                self.error = error
            }
        } receiveValue: { [weak self] root in
            guard let self = self else { return }
            self.items = root.listings
            if let currentUser = UserViewModel.shared.fetchCurrentUser() {
                print(currentUser)
            }
        }.store(in: &subscriptions)
    }
}
