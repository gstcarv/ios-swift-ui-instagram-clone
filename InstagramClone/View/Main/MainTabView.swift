//
//  MainTabView.swift
//  InstagramClone
//
//  Created by Gustavo Carvalho on 19/04/22.
//

import SwiftUI

enum MainTabs: String {
    case home = "Home"
    case search = "Search"
    case upload = "Upload"
    case notifications = "Notifications"
    case profile = "Profile"
}

struct MainTabView: View {
    
    @State var selectedTab: MainTabs = .home
    
    var body: some View {
        NavigationView {
            TabView (selection: $selectedTab) {
                FeedView()
                    .tabItem {
                        Image(systemName: "house")
                            .environment(\.symbolVariants, .none)
                    }
                    .tag(MainTabs.home)
                
                SearchView()
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                            .environment(\.symbolVariants, .none)
                    }
                    .tag(MainTabs.search)
                
                UploadPostView()
                    .tabItem {
                        Image(systemName: "plus.square")
                            .environment(\.symbolVariants, .none)
                    }
                    .tag(MainTabs.upload)
                
                NotificationView()
                    .tabItem {
                        Image(systemName: "heart")
                            .environment(\.symbolVariants, .none)
                    }
                    .tag(MainTabs.notifications)
                
                ProfileView()
                    .tabItem {
                        Image(systemName: "person")
                            .environment(\.symbolVariants, .none)
                    }
                    .tag(MainTabs.profile)
            }
            .navigationTitle(selectedTab.rawValue)
            .accentColor(.black)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}