//
//  AlternateLoginButton.swift
//  AirBnbTutorial
//
//  Created by Joffrey Mann on 8/28/24.
//

import SwiftUI

struct CustomLabel: LabelStyle {
    var spacing: Double = 0.0
    
    func makeBody(configuration: Configuration) -> some View {
        HStack() {
            configuration.icon
            Spacer()
            configuration.title
            Spacer()
        }
    }
}

struct AlternateLoginButton: View {
    @State var text: String
    @State var width: CGFloat = 140
    @State var height: CGFloat = 40
    @State var backgroundColor: Color = .clear
    @State var textColor: Color = .black
    @State var image: String = "mail"
    @State var isCustomImage = false
    
    var body: some View {
        Button {
            
        } label: {
            if isCustomImage {
                Label {
                    Text(text)
                } icon: {
                    Image("google")
                        .resizable()
                        .scaledToFit()
                }
                .padding()
                .fontWeight(.semibold)
                .frame(width: width, height: height)
                .foregroundStyle(textColor)
                .background(backgroundColor)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 1)
                        .foregroundStyle(.black)
                }
                .labelStyle(CustomLabel(spacing: 50))
            } else {
                Label(text, systemImage: image)
                    .padding()
                    .fontWeight(.semibold)
                    .frame(width: width, height: height)
                    .foregroundStyle(textColor)
                    .background(backgroundColor)
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 1)
                            .foregroundStyle(.black)
                    }
                    .labelStyle(CustomLabel(spacing: 50))
            }
            
        }
    }
}

#Preview {
    AlternateLoginButton(text: "Continue with email", width: 350, height: 50)
}
