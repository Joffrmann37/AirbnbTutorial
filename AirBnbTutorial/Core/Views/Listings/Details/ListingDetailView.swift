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
            DetailHeaderView(listing: $listing) {
                dismiss()
            }
            
            DetailSubheaderView(listing: $listing)
            
            Divider()
            
            // Host info view
            HostInfoView()
            
            Divider()
            
            ListingFeaturesView(features: .constant(listing.features))
            
            Divider()
            
            BedroomsView(bedding: .constant(listing.bedding))
            
            Divider()
            
            AmenitiesView(amenityInfo: listing.amenityInfo)
            
            Divider()
            
            MapView(location: listing.location)
        }
        .navigationBarBackButtonHidden()
        .ignoresSafeArea()
        .padding(.bottom, 64)
        .overlay(alignment: .bottom) {
            BottomFloatingView(reservation: listing.reservationInfo)
        }
        .environment(RatingViewModel(rating: "4.86", numOfReviews: 28))
        .environment(HostInfoViewModel(name: "Joffrey Mann", numOfGuests: 4, numOfBedrooms: 4, numOfBeds: 4, numOfBaths: 3, profilePic: "joffreyProfile"))
    }
}

#Preview {
    ListingDetailView(path: .constant([]), listing: .constant(Listing(location: Location(city: "Miami", state: "FL", distance: "12 mi", coordinates: Coordinate(latitude: 25.781441, longitude: -80.188332)), reservationInfo: Reservation(date: "Nov 3 - 10", frequency: "night", price: 567), caption: "Miami Villa", images: ["https://robbreport.com/wp-content/uploads/2020/05/rubiks06.jpg?w=1000"], features: [Feature(type: "Superhost", detail: "Superhosts are experienced, highly rated hosts who are committed to providing greeat starts for guests.", image: "medal")], bedding: Bedding(title: "Where you'll sleep", beds: [Bed(title: "Bedroom 1", detail: "1 queen bed"),Bed(title: "Bedroom 2", detail: "1 queen bed")]), amenityInfo: AmenityInfo(title: "What this place offers", amenities: [Amenity(image: "wifi", detail: "Wifi")]))))
}
