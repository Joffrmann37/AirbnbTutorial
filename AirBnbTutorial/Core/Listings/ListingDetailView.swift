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
        
    @Binding var path: [Int]
    
    @Binding var listing: Int
    
    var body: some View {
        ScrollView {
            ListingImageCarouselView(viewModel: ListingImageCarouselViewModel(images: images))
                .frame(height: 320)
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Miami Villa")
                    .font(.title)
                    .fontWeight(.semibold)
                VStack(alignment: .leading) {
                    RatingView()
                    Text("Miami, Florida")
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
        .environmentObject(RatingViewModel(rating: "4.86", numOfReviews: 28))
        .environment(HostInfoViewModel(name: "Joffrey mann", numOfGuests: 4, numOfBedrooms: 4, numOfBeds: 4, numOfBaths: 3, profilePic: "joffreyProfile"))
    }
}

#Preview {
    ListingDetailView(path: .constant([]), listing: .constant(1))
}
