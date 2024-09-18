//
//  MainTabView.swift
//  AirBnbTutorial
//
//  Created by Joffrey Mann on 9/18/24.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            ExploreView()
                .environment(UserViewModel.shared)
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
    MainTabView()
}
