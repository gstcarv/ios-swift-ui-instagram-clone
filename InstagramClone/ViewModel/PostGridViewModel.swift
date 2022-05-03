//
//  PostGridViewModel.swift
//  InstagramClone
//
//  Created by Gustavo Carvalho on 03/05/22.
//

import Foundation

enum PostGridConfiguration {
    case explore
    case profile(String)
}

class PostGridViewModel: ObservableObject {
    
    @Published var posts = [Post]()
    
    let config: PostGridConfiguration
    
    init(config: PostGridConfiguration) {
        self.config = config
        
        fetchPosts(forConfig: config)
    }
    
    func fetchPosts(forConfig config: PostGridConfiguration) {
        switch config {
        case.explore:
            fetchExplorePosts()
        case .profile(let uid):
            fetchUserPosts(forUid: uid)
        }
    }
    
    func fetchExplorePosts() {
        PostService.getAllPosts { posts in self.posts = posts }
    }
    
    func fetchUserPosts(forUid uid: String) {
        PostService.getByUser(fromUser: uid) { posts in self.posts = posts }
    }
}
