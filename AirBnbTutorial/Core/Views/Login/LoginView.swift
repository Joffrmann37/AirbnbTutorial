//
//  LoginView.swift
//  AirBnbTutorial
//
//  Created by Joffrey Mann on 8/28/24.
//

import SwiftUI
import GoogleSignIn

struct LoginView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        GeometryReader { reader in
            VStack {
                HStack(spacing: 100) {
                    Image(systemName: "xmark")
                        .frame(width: 40, height: 40)
                        .onTapGesture {
                            dismiss()
                        }
                    
                    Text("Log in or sign up")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    
                    Spacer()
                }
                
                Divider()
                
                VStack(alignment: .leading) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Country/Region")
                                .font(.caption2)
                                .foregroundStyle(.gray)
                            TextField("", text: .constant("United States (+1)"))
                                .font(.callout)
                        }
                        Image(systemName: "chevron.down")
                    }
                    .padding([.horizontal], 10)
                    .padding([.vertical], 5)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 1).foregroundColor(Color.black))
                    
                    HStack {
                        TextField("", text: .constant(""), prompt: Text("Phone Number")
                            .foregroundColor(Color.gray))
                    }
                    .padding([.horizontal], 10)
                    .padding([.vertical], 10)
                }
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 1).foregroundColor(.gray))
                .padding()
                
                Text("We'll call or text to confirm your number. Standard message and data rates apply.")
                    .font(.caption2)
                    .foregroundStyle(.black)
                    .padding(.horizontal, 20)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                TemplateButton(text: "Continue", width: 350, height: 50) {
                    
                }
                    .padding(.top, 20)
                
                LabelledDivider(label: "Or")
                    .padding(.bottom, 20)
                
                AlternateLoginButton(text: "Continue with email", action: {
                    print("Email hit")
                }, width: 350, height: 50)
                
                AlternateLoginButton(text: "Continue with Apple", action: {
                    print("Apple hit")
                }, width: 350, height: 50, image: "apple.logo")
                    .padding(.top, 10)
                
                AlternateLoginButton(text: "Continue with Google", action: {
                    guard let presentingViewController = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first?.rootViewController else {return}
                    let signInConfig = GIDConfiguration.init(clientID: "CLIENT_ID")
                    GIDSignIn.sharedInstance.signIn(withPresenting: presentingViewController) { result, error in
                        print(result)
                    }
                }, width: 350, height: 50, image: "google", isCustomImage: true)
                    .padding(.top, 10)
            }
            .frame(maxHeight: .infinity, alignment: .top)
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    LoginView()
}
