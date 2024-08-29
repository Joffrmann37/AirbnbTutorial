//
//  BedroomsView.swift
//  AirBnbTutorial
//
//  Created by Joffrey Mann on 8/26/24.
//

import SwiftUI

struct BedroomsView: View {
    @Binding var bedding: Bedding
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(bedding.title)
                .font(.headline)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(bedding.beds, id: \.self) { bedroom in
                        VStack {
                            Image(systemName: "bed.double")
                            
                            Text(bedroom.title)
                            
                            Text(bedroom.detail)
                        }
                        .frame(width: 132, height: 100)
                        .overlay {
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(lineWidth: 1)
                                .foregroundStyle(.gray)
                        }
                    }
                }
            }
            .scrollTargetBehavior(.paging)
        }
        .padding()
    }
}

#Preview {
    BedroomsView(bedding: .constant(Bedding(title: "Where you'll sleep", beds: [Bed(title: "Bedroom 1", detail: "1 queen bed"), Bed(title: "Bedroom 2", detail: "1 queen bed")])))
}
