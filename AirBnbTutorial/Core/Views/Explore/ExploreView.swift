//
//  ExploreView.swift
//  AirBnbTutorial
//
//  Created by Joffrey Mann on 8/12/24.
//

import SwiftUI

struct ExploreVMKey: EnvironmentKey {
    static var defaultValue = ExploreViewModel(useCase: FetchListingsUseCase(repository: ListingsRepository()), url: URL(string: "http://127.0.0.1:5000/listings")!)
}

private extension EnvironmentValues {
    var vm: ExploreViewModel {
        get { self[ExploreVMKey.self] }
        set { self[ExploreVMKey.self] = newValue }
    }
}

struct ExploreView: View {
    @Environment(\.vm) var vm
    @State var navigationPath = [Listing]()
    @State var selectedListing: Listing?
    
    var body: some View {
        NavigationStack(path: $navigationPath) {
            ScrollView {
                SearchAndFilterBar()
                LazyVStack(spacing: 32) {
                    ForEach(vm.items, id: \.self) { listing in
                        Button(action: {
                            selectedListing = listing
                            navigationPath.append(listing)
                        }, label: {
                            NavigationLink(value: listing) {
                                ListingItemView(listing: .constant(listing))
                                    .frame(height: 400)
                                    .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
                            }
                        })
                    }
                }
                .padding()
            }
            .onAppear() {
                vm.fetchItems()
            }
            .environment(ExploreViewModel(useCase: FetchListingsUseCase(repository: ListingsRepository()), url: URL(string: "http://127.0.0.1:5000/listings")!))
            .navigationDestination(for: Listing.self) { listing in
                ListingDetailView(path: $navigationPath, listing: .constant(listing))
            }
        }
    }
}

#Preview {
    ExploreView()
}
