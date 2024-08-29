//
//  DetailHeaderView.swift
//  AirBnbTutorial
//
//  Created by Joffrey Mann on 8/27/24.
//

import SwiftUI

struct DetailSubheaderView: View {
    @Binding var listing: Listing
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(listing.caption)
                .font(.title)
                .fontWeight(.semibold)
            VStack(alignment: .leading) {
                RatingView()
                Text(listing.location.city)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.leading)
        .font(.caption)
    }
}

#Preview {
    DetailSubheaderView(listing: .constant(Listing(location: Location(city: "Miami", state: "FL", distance: "12 mi", coordinates: Coordinate(latitude: 25.781441, longitude: -80.188332)), reservationInfo: Reservation(date: "Nov 3 - 10", frequency: "night", price: 567), caption: "Miami Villa", images: ["https://robbreport.com/wp-content/uploads/2020/05/rubiks06.jpg?w=1000"], features: [Feature(type: "Superhost", detail: "Superhosts are experienced, highly rated hosts who are committed to providing greeat starts for guests.", image: "medal")], bedding: Bedding(title: "Where you'll sleep", beds: [Bed(title: "Bedroom 1", detail: "1 queen bed"),Bed(title: "Bedroom 2", detail: "1 queen bed")]), amenityInfo: AmenityInfo(title: "What this place offers", amenities: [Amenity(image: "wifi", detail: "Wifi")]))))
}
