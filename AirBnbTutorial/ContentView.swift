//
//  ContentView.swift
//  AirBnbTutorial
//
//  Created by Joffrey Mann on 8/12/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            ExploreView()
                .tabItem {
                    Label("Explore", systemImage: "magnifyingglass")
                }
            WishlistsView()
                .tabItem {
                    Label("Wishlists", systemImage: "heart")
                }
            TripsView()
                .tabItem {
                    Label("Trips", systemImage: "bag")
                }
            InboxView()
                .tabItem {
                    Label("Inbox", systemImage: "message")
                }
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
        }
        .accentColor(Color.pink)
    }
}

#Preview {
    ContentView()
}
