//
//  CommentsVIew.swift
//  InstagramClone
//
//  Created by Gustavo Carvalho on 06/05/22.
//

import SwiftUI

struct CommentsView: View {
    
    @ObservedObject var viewModel: CommentViewModel
    
    init (post: Post) {
        self.viewModel = CommentViewModel(post: post)
    }
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVStack (alignment: .leading) {
                    
                    CommentCell(comment: viewModel.postCaptionComment)
                    
                    Divider()
                    
                    ForEach(viewModel.comments) { comment in
                        CommentCell(comment: comment)
                    }
                }.padding(.top, 24)
            }
            
            CommentInputView(viewModel: viewModel)
        }
        .navigationTitle("Comments")
        .tint(.black)
    }
}
