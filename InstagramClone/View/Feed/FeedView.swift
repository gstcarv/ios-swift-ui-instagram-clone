//
//  FeedView.swift
//  InstagramClone
//
//  Created by Gustavo Carvalho on 19/04/22.
//

import SwiftUI

struct FeedView: View {
    
    @ObservedObject var viewModel = FeedViewModel()
    
    var mainPost: Post?;
    
    var body: some View {
        ScrollView {
            LazyVStack (alignment: .leading, spacing: 24) {
                
                if (mainPost != nil) {
                    FeedCell(post: mainPost!)
                        .padding(.top, 10)
                }
                
                ForEach(viewModel.posts) { post in
                    if (mainPost == nil || mainPost?.id != post.id) {
                        FeedCell(post: post)
                            .padding(.top, 10)
                    }
                }
            }
        }
    }
}
