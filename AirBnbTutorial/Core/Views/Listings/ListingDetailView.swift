//
//  ListingDetailView.swift
//  AirBnbTutorial
//
//  Created by Joffrey Mann on 8/12/24.
//

import SwiftUI
import Combine

struct ListingDetailView: View {
    @Binding var path: [Listing]
    
    @Binding var listing: Listing
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .topLeading) {
                ListingImageCarouselView(viewModel: ListingImageCarouselViewModel(images: listing.images))
                    .frame(height: 320)
                
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(.black)
                        .background {
                            Circle()
                                .fill(.white)
                                .frame(width: 32, height: 32)
                        }
                        .padding(32)
                }
            }
            
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
            
            ListingFeaturesView(features: .constant(listing.features))
            
            Divider()
            
            BedroomsView(bedding: .constant(listing.bedding))
            
            Divider()
            
            AmenitiesView()
            
            Divider()
            
            MapView()
        }
        .navigationBarBackButtonHidden()
        .ignoresSafeArea()
        .padding(.bottom, 64)
        .overlay(alignment: .bottom) {
            BottomFloatingView()
        }
        .environment(RatingViewModel(rating: "4.86", numOfReviews: 28))
        .environment(HostInfoViewModel(name: "Joffrey Mann", numOfGuests: 4, numOfBedrooms: 4, numOfBeds: 4, numOfBaths: 3, profilePic: "joffreyProfile"))
    }
}

#Preview {
    ListingDetailView(path: .constant([]), listing: .constant(Listing(city: "Miami", date: "Nov 3 - 10", distance: "12 mi", frequency: "night", price: 567, state: "FL", caption: "Miami Villa", images: ["https://robbreport.com/wp-content/uploads/2020/05/rubiks06.jpg?w=1000"], features: [Feature(type: "Superhost", detail: "Superhosts are experienced, highly rated hosts who are committed to providing greeat starts for guests.", image: "medal")], bedding: Bedding(title: "Where you'll sleep", beds: [Bed(title: "Bedroom 1", detail: "1 queen bed"),Bed(title: "Bedroom 2", detail: "1 queen bed")]))))
}
