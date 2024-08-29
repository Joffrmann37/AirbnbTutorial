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
    @Environment(\.vm) var vm
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    Text("Profile")
                        .font(.title)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text("Log in to start planning your next trip.")
                        .font(.subheadline)
                        .padding(.top, 0.1)
                    
                    TemplateButton(text: "Log in", width: 350, height: 50)
                        .padding(.top, 40)
                    
                    NoAccountView()
                    
                    AirbnbFloatingView()
                    
                    LazyVStack {
                        ForEach(vm.items, id: \.self) { item in
                            VStack(alignment: .leading) {
                                HStack {
                                    Image(systemName: item.icon)
                                        .resizable()
                                        .frame(width: 32, height: 32)
                                        .padding(.trailing, 10)
                                    
                                    Text(item.name)
                                    
                                    Spacer()
                                    
                                    Image(systemName: "chevron.right")
                                        .padding(.trailing, 20)
                                }
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            Divider()
                                .padding(.trailing, 20)
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
