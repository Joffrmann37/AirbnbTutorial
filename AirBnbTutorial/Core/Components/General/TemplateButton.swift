//
//  TemplateButton.swift
//  AirBnbTutorial
//
//  Created by Joffrey Mann on 8/27/24.
//

import SwiftUI

struct TemplateButton: View {
    @State var text: String
    @State var width: CGFloat = 140
    @State var height: CGFloat = 40
    var action: (() -> Void)
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(text)
                .foregroundStyle(.white)
                .font(.subheadline)
                .fontWeight(.semibold)
                .frame(width: width, height: height)
                .background(.pink)
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
    }
}

#Preview {
    TemplateButton(text: "Reserve", action: {
        
    })
}
