//
//  TripsView.swift
//  AirBnbTutorial
//
//  Created by Joffrey Mann on 8/27/24.
//

import SwiftUI

struct TripsView: View {
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Text("Trips")
                    .font(.title)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("No trips yet")
                    .font(.title2)
                    .fontWeight(.medium)
                    .padding(.top, 20)
                
                Text("When you're ready to plan your next rip, we're here to help.")
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true)
                
                TemplateButton(text: "Log in", width: 100, height: 50)
                    .padding(.top, 40)
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            .padding(.leading, 20)
            .padding(.bottom, 400)
            .ignoresSafeArea()
        }
    }
}

#Preview {
    TripsView()
}
