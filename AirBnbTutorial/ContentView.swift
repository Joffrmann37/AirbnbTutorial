//
//  ContentView.swift
//  AirBnbTutorial
//
//  Created by Joffrey Mann on 8/12/24.
//

import SwiftUI

struct UserVMKey: EnvironmentKey {
    static var defaultValue = UserViewModel.shared
}

private extension EnvironmentValues {
    var vm: UserViewModel {
        get { self[UserVMKey.self] }
        set { self[UserVMKey.self] = newValue }
    }
}

struct ContentView: View {
    @Environment(\.vm) var vm
    
    var body: some View {
        if vm.isLoggedIn {
            MainTabView()
        } else {
            LoginView()
                .environment(UserViewModel.shared)
                .environment(SignUpViewModel(useCase: SignUpUseCase(repository: SignUpRepository())))
        }
    }
}

#Preview {
    ContentView()
}
