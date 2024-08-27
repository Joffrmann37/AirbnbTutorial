//
//  MapView.swift
//  AirBnbTutorial
//
//  Created by Joffrey Mann on 8/26/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Where you'll be")
                .font(.headline)
            
            Map()
                .frame(height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 12))
        }
        .padding()
    }
}

#Preview {
    MapView()
}
