//
//  WishlistsView.swift
//  AirBnbTutorial
//
//  Created by Joffrey Mann on 8/27/24.
//

import SwiftUI

struct WishlistsView: View {
    @State var shouldShowLogin = false
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .trailing) {
                NavButton(text: "Edit")
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            .padding(.trailing, 10)
            .padding(.top, 60)
            VStack(alignment: .leading) {
                Text("Wishlists")
                    .font(.title)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("Log in to view your wishlists")
                    .font(.title2)
                    .fontWeight(.medium)
                    .padding([.leading, .top], 20)
                
                Text("You can create, view, or edit wishlists once you've logged in.")
                    .padding([.leading, .trailing], 20)
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true)
                
                TemplateButton(text: "Log in", width: 100, height: 50) {
                    self.shouldShowLogin = true
                }
                .padding(.leading, 20)
                .padding(.top, 40)
                .sheet(isPresented: $shouldShowLogin) {
                    let request = URLRequest(url: URL(string: "http://127.0.0.1:8000/login")!)
                    LoginView()
                        .environment(LoginViewModel(useCase: LoginUseCase(repository: LoginRepository())))
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            .padding(.leading, 20)
            .padding(.bottom, 500)
            .ignoresSafeArea()
        }
    }
}

#Preview {
    WishlistsView()
}
