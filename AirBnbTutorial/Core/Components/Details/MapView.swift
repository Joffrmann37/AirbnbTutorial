//
//  MapView.swift
//  AirBnbTutorial
//
//  Created by Joffrey Mann on 8/26/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    @State var location: Location
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Where you'll be")
                .font(.headline)
            
            Map(initialPosition: .region(getRegion()))
                        .onMapCameraChange(frequency: .continuous) {
                            print($0.region)
                        }
                .frame(height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 12))
        }
        .padding()
    }
    
    private func getRegion() -> MKCoordinateRegion {
        return MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: location.coordinates.latitude, longitude: location.coordinates.longitude),
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        )
    }
}

#Preview {
    MapView(location: Location(city: "Miami", state: "FL", distance: "12 mi", coordinates: Coordinate(latitude: 25.781441, longitude: -80.188332)))
}
