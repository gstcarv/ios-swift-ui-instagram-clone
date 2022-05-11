//
//  CommentInputView.swift
//  InstagramClone
//
//  Created by Gustavo Carvalho on 06/05/22.
//

import SwiftUI

struct CommentInputView: View {
    
    @ObservedObject var viewModel: CommentViewModel
    
    @State var commentText = ""
    
    var body: some View {
        VStack (alignment: .trailing, spacing: 0) {
            Divider()
            
            HStack {
                TextField("Message...", text: $commentText)
                    .textFieldStyle(PlainTextFieldStyle())
                    .frame(minHeight: 30)
                    .padding()
                
                Spacer()
                
                Button("Send", role: .none, action: {
                    viewModel.uploadComment(commentText: commentText)
                    commentText = ""
                })
                    .font(.system(size: 16, weight: .semibold, design: .default))
                    .padding(.trailing)
                    .tint(.black)
            }
            
        }
    }
}
