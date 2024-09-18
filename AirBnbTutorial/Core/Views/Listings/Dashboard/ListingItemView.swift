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
                    Text(listing.location.city)
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)
                    Text("\(listing.location.distance) away")
                        .foregroundStyle(.gray)
                    Text(listing.reservationInfo.date)
                        .foregroundStyle(.gray)
                    HStack(spacing: 4) {
                        Text("$\(listing.reservationInfo.price)")
                            .fontWeight(.semibold)
                        Text(listing.reservationInfo.frequency)
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
    ListingItemView(listing: .constant(Listing(id: 1, type: "Home", owner: Owner(id: 1, name: "John Smith", imgUrl: ""),location: Location(city: "Miami", state: "FL", distance: "12 mi", coordinates: Coordinate(latitude: 25.781441, longitude: -80.188332)), reservationInfo: Reservation(date: "Nov 3 - 10", frequency: "night", price: 567), caption: "Miami Villa", images: ["https://robbreport.com/wp-content/uploads/2020/05/rubiks06.jpg?w=1000"], features: [Feature(type: "Superhost", detail: "Superhosts are experienced, highly rated hosts who are committed to providing greeat starts for guests.", image: "medal")], bedding: Bedding(title: "Where you'll sleep", beds: [Bed(title: "Bedroom 1", detail: "1 queen bed"),Bed(title: "Bedroom 2", detail: "1 queen bed")]), amenityInfo: AmenityInfo(title: "What this place offers", amenities: [Amenity(image: "wifi", detail: "Wifi")]))))
}
