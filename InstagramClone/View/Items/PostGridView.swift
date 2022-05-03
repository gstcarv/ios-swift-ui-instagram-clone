//
//  PostGridView.swift
//  InstagramClone
//
//  Created by Gustavo Carvalho on 20/04/22.
//

import SwiftUI
import Kingfisher

struct PostGridView: View {
    private let items = [GridItem(), GridItem(), GridItem()]
    private let width = UIScreen.main.bounds.width / 3
    
    let config: PostGridConfiguration
    @ObservedObject var viewModel: PostGridViewModel
    
    init (config: PostGridConfiguration) {
        self.config = config
        self.viewModel = PostGridViewModel(config: config)
    }
    
    
    var body: some View {
        LazyVGrid(columns: items, spacing: 2) {
            ForEach(viewModel.posts) { post in
                NavigationLink {
                    FeedView()
                } label: {
                    KFImage(URL(string: post.imageUrl))
                        .resizable()
                        .scaledToFill()
                        .frame(width: width, height: width)
                    .clipped()
                }

            }
        }
    }
}
