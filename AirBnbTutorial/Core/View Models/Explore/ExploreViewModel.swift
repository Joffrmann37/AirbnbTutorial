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
    var url: URL = URL(string: "http://127.0.0.1:5000/listings")!
    var items = [Listing]()
    var error: ABError?
    
    init(useCase: FetchListingsUseCase, subscriptions: Set<AnyCancellable> = Set<AnyCancellable>(), url: URL) {
        self.useCase = useCase
        self.subscriptions = subscriptions
        self.url = url
    }
    
    func fetchItems<T>(type: T.Type = Root.self) where T: Root {
        useCase.fetchItems(url: url).sink { [unowned self] completion in
            if case let .failure(error) = completion {
                self.error = error
            }
        } receiveValue: { [weak self] root in
            guard let self = self else { return }
            self.items = root.listings
        }.store(in: &subscriptions)
    }
}
