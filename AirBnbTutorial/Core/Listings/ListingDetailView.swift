//
//  ListingDetailView.swift
//  AirBnbTutorial
//
//  Created by Joffrey Mann on 8/12/24.
//

import SwiftUI
import Combine

struct ListingDetailView: View {
    var images = [
        "listing-1",
        "listing-2",
        "listing-3",
        "listing-4"
    ]
    
    @State var shouldShowViewTwo = false
    
    @Binding var path: [Int]
    
    @Binding var listing: Int
    
    var body: some View {
        ScrollView {
            NavigationLink(value: "") {
                ListingImageCarouselView(viewModel: ListingImageCarouselViewModel(images: images))
            }
        }
        .onChange(of: shouldShowViewTwo, initial: false, { oldValue, newValue in
            if newValue {
                path.append(listing)
            }
        })
        .onAppear() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                self.shouldShowViewTwo = true
            }
            
        }
        .navigationDestination(isPresented: $shouldShowViewTwo, destination: {
            ViewTwo(navigationPath: $path)
        })
    }
}

#Preview {
    ListingDetailView(path: .constant([]), listing: .constant(1))
}
