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
    
    init() {
        let navigationBarAppearence = UINavigationBarAppearance()
        
        navigationBarAppearence.configureWithOpaqueBackground()
        navigationBarAppearence.backgroundColor = UIColor(named: "Gray")
        
        UINavigationBar.appearance().compactAppearance = navigationBarAppearence
        UINavigationBar.appearance().standardAppearance = navigationBarAppearence
        UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearence
    }
    
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
                
                UploadPostView(selectedTab: $selectedTab)
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
                
                ProfileView(user: AuthViewModel.shared.currentUser!)
                    .tabItem {
                        Image(systemName: "person")
                            .environment(\.symbolVariants, .none)
                    }
                    .tag(MainTabs.profile)
            }
            .navigationTitle(selectedTab.rawValue)
            .accentColor(.black)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: logoutButton)
        }
    }
    
    var logoutButton: some View {
        Button(action: {
            AuthViewModel.shared.signOut()
        }) {
            Text("Logout")
                .foregroundColor(.black)
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
