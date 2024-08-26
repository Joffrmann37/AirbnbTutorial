//
//  ListingView.swift
//  AirBnbTutorial
//
//  Created by Joffrey Mann on 8/12/24.
//

import SwiftUI

struct ListingItemView: View {
    var images = [
        "listing-1",
        "listing-2",
        "listing-3",
        "listing-4"
    ]
    
    var body: some View {
        VStack(spacing: 8) {
            // images
            ListingImageCarouselView(viewModel: ListingImageCarouselViewModel(images: images))
                .frame(height: 320)
                .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))

            // listing details

            HStack(alignment: .top) {
                // details
                VStack(alignment: .leading) {
                    Text("Miami, Florida")
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)
                    Text("12 mi away")
                        .foregroundStyle(.gray)
                    Text("Nov 3 - 10")
                        .foregroundStyle(.gray)
                    HStack(spacing: 4) {
                        Text("$567")
                            .fontWeight(.semibold)
                        Text("night")
                    }
                    .foregroundStyle(.black)
                }
                Spacer()
                RatingView()
            }
            .environment(RatingViewModel(rating: "4.86", numOfReviews: 28))
            .font(.footnote)
        }
    }
}

#Preview {
    ListingItemView()
}
