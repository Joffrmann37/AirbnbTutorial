//
//  AmenitiesView.swift
//  AirBnbTutorial
//
//  Created by Joffrey Mann on 8/26/24.
//

import SwiftUI

struct AmenitiesView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("What this place offers")
                .font(.headline)
            
            ForEach(0..<5) { feature in
                HStack {
                    Image(systemName: "wifi")
                        .frame(width: 32)
                    
                    Text("Wifi")
                        .font(.footnote)
                    
                    Spacer()
                }
            }
        }
        .padding()
    }
}

#Preview {
    AmenitiesView()
}
