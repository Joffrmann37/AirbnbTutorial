//
//  BottomFloatingView.swift
//  AirBnbTutorial
//
//  Created by Joffrey Mann on 8/26/24.
//

import SwiftUI

struct BottomFloatingView: View {
    @State var reservation: Reservation
    
    var body: some View {
        VStack {
            Divider()
                .padding(.bottom)
            
            HStack {
                VStack(alignment: .leading) {
                    Text("$\(reservation.price)")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    
                    Text("Total before taxes")
                        .font(.footnote)
                    
                    Text(reservation.date)
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .underline()
                }
                
                Spacer()
                
                TemplateButton(text: "Reserve") {
                    
                }
            }
            .padding(.horizontal, 32)
        }
        .background(.white)
    }
}

#Preview {
    BottomFloatingView(reservation: Reservation(date: "Nov 3 - 10", frequency: "night", price: 567))
}
