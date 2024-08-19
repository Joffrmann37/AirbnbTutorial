//
//  ListingImageCarouselView.swift
//  AirBnbTutorial
//
//  Created by Joffrey Mann on 8/12/24.
//

import SwiftUI

class ListingImageCarouselViewModel: ObservableObject {
    @Published var images: [String]
    
    init(images: [String]) {
        self.images = images
    }
}

struct ListingImageCarouselView: View {
    @StateObject var viewModel: ListingImageCarouselViewModel
    
    var body: some View {
        TabView {
            ForEach(viewModel.images, id: \.self) { image in
                Image(image)
                    .resizable()
                    .scaledToFill()
            }
        }
        .tabViewStyle(.page)
    }
}

#Preview {
    ListingImageCarouselView(viewModel: ListingImageCarouselViewModel(images: [
        "listing-1",
        "listing-2",
        "listing-3",
        "listing-4"
    ]))
}
