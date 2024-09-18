//
//  AirBnbTutorialApp.swift
//  AirBnbTutorial
//
//  Created by Joffrey Mann on 8/12/24.
//

import SwiftUI

@main
struct AirBnbTutorialApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(UserViewModel.shared)
        }
    }
}
