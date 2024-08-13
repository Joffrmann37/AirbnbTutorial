//
//  ExploreView.swift
//  AirBnbTutorial
//
//  Created by Joffrey Mann on 8/12/24.
//

import SwiftUI

struct ExploreView: View {
    @State var navigationPath = [Int]()
    @State var selectedListing = 0
    
    var body: some View {
        NavigationStack(path: $navigationPath) {
            ScrollView {
                SearchAndFilterBar()
                LazyVStack(spacing: 32) {
                    ForEach(0 ... 10, id: \.self) { listing in
                        Button(action: {
                            selectedListing = listing
                            navigationPath.append(listing)
                        }, label: {
                            NavigationLink(value: listing) {
                                ListingItemView()
                                    .frame(height: 400)
                                    .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
                            }
                        })
                    }
                }
                .padding()
            }
            .navigationDestination(for: Int.self) { listing in
                ListingDetailView(path: $navigationPath, listing: $selectedListing)
            }
        }
    }
}

#Preview {
    ExploreView()
}
