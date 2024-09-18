//
//  ProfileView.swift
//  AirBnbTutorial
//
//  Created by Joffrey Mann on 8/27/24.
//

import SwiftUI

struct ProfileVMKey: EnvironmentKey {
    static var defaultValue = ProfileViewModel(items: [
        ProfileItem(name: "Settings", icon: "gearshape"),
        ProfileItem(name: "Accessibility", icon: "accessibility"),
        ProfileItem(name: "Visit the Help Center", icon: "questionmark.circle")
    ]
    )
}

private extension EnvironmentValues {
    var vm: ProfileViewModel {
        get { self[ProfileVMKey.self] }
        set { self[ProfileVMKey.self] = newValue }
    }
}

struct ProfileView: View {
    @State var shouldShowLogin = false
    @Environment(\.vm) var vm
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 8) {
                    VStack(alignment: .leading) {
                        Text("Profile")
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text("Log in to start planning your next trip.")
                            .font(.subheadline)
                            .padding(.top, 0.1)
                        
                        TemplateButton(text: "Log in", width: 360, height: 48) {
                            self.shouldShowLogin = true
                        }
                        .padding(.top, 40)
                        .sheet(isPresented: $shouldShowLogin) {
                            LoginView()
                                .environment(LoginViewModel(useCase: LoginUseCase(repository: LoginRepository())))
                        }
                    }
                    
                    NoAccountView()
                    
                    AirbnbFloatingView()
                    
                    LazyVStack {
                        ForEach(vm.items, id: \.self) { item in
                            ProfileOptionRowView(item: item)
                        }
                    }
                    .padding(.top, 20)
                }
                .padding(.top, 60)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            .padding(.leading, 20)
            .padding(.top, 60)
            .ignoresSafeArea()
        }
    }
}

#Preview {
    ProfileView()
}
