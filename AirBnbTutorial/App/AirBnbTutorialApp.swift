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
        }
    }
}


struct ViewTwo: View {
    @Binding var navigationPath: [Int]
    
    var body: some View {
        Text("View Two")
        Button(action: {
            navigationPath.removeAll()
        }, label: {
            /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
        })
    }
}

#Preview {
    ViewTwo(navigationPath: .constant([]))
}

struct ViewThree: View {
    var body: some View {
        Text("View Three")
    }
}

#Preview {
    ViewThree()
}
