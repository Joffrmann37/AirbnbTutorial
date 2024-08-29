//
//  InboxView.swift
//  AirBnbTutorial
//
//  Created by Joffrey Mann on 8/27/24.
//

import SwiftUI

struct InboxView: View {
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Text("Inbox")
                    .font(.title)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("Log in to see messages")
                    .font(.title2)
                    .fontWeight(.medium)
                    .padding(.top, 20)
                
                Text("Once you login, you'll find messages from hosts here.")
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
    InboxView()
}
