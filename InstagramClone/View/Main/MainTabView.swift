//
//  MainTabView.swift
//  InstagramClone
//
//  Created by Gustavo Carvalho on 19/04/22.
//

import SwiftUI

struct MainTabView: View {
    
    var body: some View {
        TabView {
            FeedView()
                .tabItem {
                    Image(systemName: "house")
                        .environment(\.symbolVariants, .none)
                }
            
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                        .environment(\.symbolVariants, .none)
                }
            
            UploadPostView()
                .tabItem {
                    Image(systemName: "plus.square")
                        .environment(\.symbolVariants, .none)
                }
            
            NotificationView()
                .tabItem {
                    Image(systemName: "heart")
                        .environment(\.symbolVariants, .none)
                }
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                        .environment(\.symbolVariants, .none)
                }
        }
        .accentColor(.black)
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
