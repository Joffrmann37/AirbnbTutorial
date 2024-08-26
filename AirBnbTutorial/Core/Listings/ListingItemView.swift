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
    
    @Binding var listing: Listing
    
    var body: some View {
        VStack(spacing: 8) {
            // images
            ListingImageCarouselView(viewModel: ListingImageCarouselViewModel(images: listing.images))
                .frame(height: 320)
                .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))

            // listing details

            HStack(alignment: .top) {
                // details
                VStack(alignment: .leading) {
                    Text(listing.city)
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)
                    Text("\(listing.distance) away")
                        .foregroundStyle(.gray)
                    Text(listing.date)
                        .foregroundStyle(.gray)
                    HStack(spacing: 4) {
                        Text("\(listing.price)")
                            .fontWeight(.semibold)
                        Text(listing.frequency)
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
    ListingItemView(listing: .constant(Listing(city: "Miami", date: "Nov 3 - 10", distance: "12 mi", frequency: "night", price: 567, state: "FL", caption: "Miami Villa", images: ["https://robbreport.com/wp-content/uploads/2020/05/rubiks06.jpg?w=1000"])))
}
