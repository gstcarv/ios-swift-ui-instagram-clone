//
//  FeedViewModel.swift
//  InstagramClone
//
//  Created by Gustavo Carvalho on 03/05/22.
//

import Foundation

class FeedViewModel: ObservableObject {
    
    @Published var posts = [Post]()
    
    init () {
        fetchPosts()
    }
    
    func fetchPosts() {
        PostService.getAllPosts { posts in self.posts = posts }
    }
    
}
