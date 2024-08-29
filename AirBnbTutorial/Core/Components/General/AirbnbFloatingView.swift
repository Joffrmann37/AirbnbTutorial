//
//  AirbnbFloatingView.swift
//  AirBnbTutorial
//
//  Created by Joffrey Mann on 8/28/24.
//

import SwiftUI

struct AirbnbFloatingView: View {
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("Airbnb your place")
                        .font(.title3)
                        .fontWeight(.semibold)
                    Text("It's simple to get set up and start earning.")
                        .foregroundStyle(.gray)
                        .font(.subheadline)
                        .padding(.top, 1)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                Image(systemName: "house")
                    .resizable()
                    .frame(width: 50, height: 50)
            }
            .padding([.leading, .trailing], 20)
        }
        .padding([.top, .bottom], 20)
        .frame(width: 350)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 12)
    }
}

#Preview {
    AirbnbFloatingView()
}
