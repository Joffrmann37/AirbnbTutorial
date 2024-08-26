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
        
    @Binding var path: [Listing]
    
    @Binding var listing: Listing
    
    var body: some View {
        ScrollView {
            ListingImageCarouselView(viewModel: ListingImageCarouselViewModel(images: listing.images))
                .frame(height: 320)
            
            VStack(alignment: .leading, spacing: 8) {
                Text(listing.caption)
                    .font(.title)
                    .fontWeight(.semibold)
                VStack(alignment: .leading) {
                    RatingView()
                    Text(listing.city)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading)
            .font(.caption)
            
            Divider()
            
            // Host info view
            HostInfoView()
            
            Divider()
            
            ListingFeaturesView()
        }
        .environment(RatingViewModel(rating: "4.86", numOfReviews: 28))
        .environment(HostInfoViewModel(name: "Joffrey mann", numOfGuests: 4, numOfBedrooms: 4, numOfBeds: 4, numOfBaths: 3, profilePic: "joffreyProfile"))
    }
}

#Preview {
    ListingDetailView(path: .constant([]), listing: .constant(Listing(city: "Miami", date: "Nov 3 - 10", distance: "12 mi", frequency: "night", price: 567, state: "FL", caption: "Miami Villa", images: ["https://robbreport.com/wp-content/uploads/2020/05/rubiks06.jpg?w=1000"])))
}
