//
//  NavButton.swift
//  AirBnbTutorial
//
//  Created by Joffrey Mann on 8/27/24.
//

import SwiftUI

struct NavButton: View {
    @State var text: String
    @State var width: CGFloat = 40
    @State var height: CGFloat = 40
    @State var color: Color = .black
    
    var body: some View {
        Button {
            
        } label: {
            Text(text)
                .underline()
                .foregroundStyle(color)
                .font(.subheadline)
                .fontWeight(.semibold)
                .frame(width: width, height: height)
                .background(.clear)
        }
    }
}

#Preview {
    NavButton(text: "Edit")
}
