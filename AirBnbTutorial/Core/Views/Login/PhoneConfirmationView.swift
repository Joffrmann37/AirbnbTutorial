//
//  PhoneConfirmationView.swift
//  AirBnbTutorial
//
//  Created by Joffrey Mann on 9/16/24.
//

import SwiftUI

struct LoginVMKey: EnvironmentKey {
    static var defaultValue = LoginViewModel(useCase: LoginUseCase(repository: LoginRepository()), userRequest: UserRequest(phone: nil, verificationCode: nil, email: "Joffrmann25@gmail.com", firstName: "Joffrey", lastName: "Mann", dob: "08/22/1984", password: "Joffman40", address: nil, emergencyContact: nil))
}

private extension EnvironmentValues {
    var vm: LoginViewModel {
        get { self[LoginVMKey.self] }
        set { self[LoginVMKey.self] = newValue }
    }
}

struct PhoneConfirmationView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.vm) var vm
    @Binding var phone: String
    @State var confirmationCode = ""
    @FocusState var isInputActive: Bool
    @State var shouldShowDashboard = false
    
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
                
                Text("Enter the code we sent over SMS to \(phone):")
                    .font(.subheadline)
                    .foregroundStyle(.black)
                    .padding([.horizontal], 20)
                    .padding(.top, 20)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack(alignment: .leading) {
                    TextField("", text: $confirmationCode, prompt: Text("-     -     -     -     -     -"))
                        .focused($isInputActive)
                    .frame(maxWidth: 360, alignment: .leading)
                    .padding([.horizontal], 10)
                    .padding([.vertical], 10)
                }
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 1).foregroundColor(.gray))
                .padding()
                
                VStack(alignment: .leading) {
                    HStack(spacing: -10) {
                        Text("Didn't get an SMS?")
                            .padding([.leading, .trailing], 20)
                            .multilineTextAlignment(.leading)
                        NavButton(text: "Send again", width: 80, height: 40)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack(alignment: .leading) {
                    NavButton(text: "More options", width: 100, height: 40)
                }
                .padding([.horizontal], 20)
                .frame(maxWidth: .infinity, alignment: .leading)
                
                if isInputActive {
                    TemplateButton(text: "Continue", width: 350, height: 50) {
                        let body = UserRequest(phone: phone, verificationCode: confirmationCode, email: nil, firstName: nil, lastName: nil, dob: nil, password: nil, address: nil, emergencyContact: nil)
                        guard let request = RequestGenerator.createRequest(urlStr: "http://127.0.0.1:8000/login", body: body, method: .POST, contentType: "application/json; charset=utf-8") else {
                            return
                        }
                        vm.login(request: request)
                    }
                }
            }
            .frame(maxHeight: .infinity, alignment: .top)
        }
        .onAppear() {
            vm.response.publisher.sink { _ in
                
            } receiveValue: { value in
                print(value.accessToken)
                self.shouldShowDashboard = !value.accessToken.isEmpty
            }

        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    PhoneConfirmationView(phone: .constant("6785910845"))
}

extension View {
    func keyboardDismissToolBar(buttonTitle: String = "Done", dismissed: (()-> Void)? = nil) -> some View {
        return toolbar {
            ToolbarItem(placement: .keyboard) {
                HStack {
                    Spacer()
                    Button(buttonTitle) {
                        //Todo: End Editing Here
                        
                        //Dismiss Action
                        dismissed?()
                    }
                }
            }
        }
    }
}
