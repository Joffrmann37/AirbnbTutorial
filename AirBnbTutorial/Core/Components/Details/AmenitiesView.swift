//
//  AmenitiesView.swift
//  AirBnbTutorial
//
//  Created by Joffrey Mann on 8/26/24.
//

import SwiftUI

struct AmenitiesView: View {
    @State var amenityInfo: AmenityInfo
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(amenityInfo.title)
                .font(.headline)
            
            ForEach(amenityInfo.amenities, id: \.self) { amenity in
                HStack {
                    Image(systemName: amenity.image)
                        .frame(width: 32)
                    
                    Text(amenity.detail)
                        .font(.footnote)
                    
                    Spacer()
                }
            }
        }
        .padding()
    }
}

#Preview {
    AmenitiesView(amenityInfo: AmenityInfo(title: "What this place offers", amenities: [Amenity(image: "wifi", detail: "Wifi")]))
}
