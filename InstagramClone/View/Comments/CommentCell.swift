//
//  CommentCell.swift
//  InstagramClone
//
//  Created by Gustavo Carvalho on 06/05/22.
//

import SwiftUI
import Kingfisher

struct CommentCell: View {
    let comment: Comment;
    
    var timestampString: String {
        return DateUtils.abbreviateDate(date: comment.timestamp)
    }
    
    var body: some View {
        HStack (alignment: .top) {
            KFImage(URL(string: comment.profileImageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: 36, height: 36)
                .clipped()
                .clipShape(Circle())
            
            VStack (alignment: .leading) {
                Text(comment.username + " ")
                    .font(.system(size: 14, weight: .semibold)) +
                
                Text(comment.commentText)
                    .font(.system(size: 14, weight: .regular))
                
                Text(timestampString)
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(.gray)
                    .padding(.top, -6)
            }
        }
        .padding(.horizontal, 15)
        .padding(.vertical, 10)
    }
}
