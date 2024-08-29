//
//  NoAccountView.swift
//  AirBnbTutorial
//
//  Created by Joffrey Mann on 8/28/24.
//

import SwiftUI

struct NoAccountView: View {
    var body: some View {
        HStack(spacing: 1) {
            Text("Don't have an account?")
                .font(.subheadline)
                .padding(.top, 5)
            NavButton(text: "Sign up", width: 70, height: 20, color: .gray)
        }
        .padding(.bottom, 30)
    }
}

#Preview {
    NoAccountView()
}
