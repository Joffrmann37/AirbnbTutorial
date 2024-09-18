//
//  LoginView.swift
//  AirBnbTutorial
//
//  Created by Joffrey Mann on 8/28/24.
//

import SwiftUI
import GoogleSignIn

struct SignupVMKey: EnvironmentKey {
    static var defaultValue = SignUpViewModel(useCase: SignUpUseCase(repository: SignUpRepository()))
}

private extension EnvironmentValues {
    var signupVM: SignUpViewModel {
        get { self[SignupVMKey.self] }
        set { self[SignupVMKey.self] = newValue }
    }
}

struct LoginView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(UserViewModel.self) var userVM
    @Environment(\.signupVM) var signupVM
    @State var phone = ""
    @State var shouldShowConfirmation = false
    
    var body: some View {
        GeometryReader { reader in
            VStack {
                HStack(spacing: 100) {
                    if userVM.isLoggedIn {
                        Image(systemName: "xmark")
                            .frame(width: 40, height: 40)
                            .onTapGesture {
                                dismiss()
                            }
                    } else {
                        Spacer()
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
                        TextField("", text: $phone, prompt: Text("Phone Number")
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
                    let body = UserRequest(phone: phone, verificationCode: nil, email: nil, firstName: nil, lastName: nil, dob: nil, password: nil, address: nil, emergencyContact: nil)
                    guard let request = RequestGenerator.createRequest(urlStr: "http://127.0.0.1:8000/signUp", body: body, method: .POST, contentType: "application/json; charset=utf-8") else {
                        return
                    }
                    signupVM.signup(request: request)
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
                    GIDSignIn.sharedInstance.signIn(withPresenting: presentingViewController) { result, error in
                        print(result)
                    }
                }, width: 350, height: 50, image: "google", isCustomImage: true)
                    .padding(.top, 10)
            }
            .sheet(isPresented: $shouldShowConfirmation) {
                PhoneConfirmationView(phone: $phone)
                    .environment(LoginViewModel(useCase: LoginUseCase(repository: LoginRepository())))
            }
            .frame(maxHeight: .infinity, alignment: .top)
        }
        .onChange(of: signupVM.response, { oldValue, newValue in
            shouldShowConfirmation = newValue?.success ?? false
        })
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    LoginView()
}
