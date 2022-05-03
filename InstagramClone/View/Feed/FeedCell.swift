//
//  FeedCell.swift
//  InstagramClone
//
//  Created by Gustavo Carvalho on 19/04/22.
//

import SwiftUI
import Kingfisher

struct FeedCell: View {
    
    var post: Post;
    
    var body: some View {
        VStack(alignment: .leading) {
            
            // user information
            HStack {
                KFImage(URL(string: post.ownerImageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 36, height: 36)
                    .clipped()
                    .cornerRadius(18)
                
                Text(post.ownerUsername)
                    .font(.system(size: 14, weight: .semibold))
            }
            .padding(10)
            
            KFImage(URL(string: post.imageUrl))
                .resizable()
                .scaledToFill()
                .frame(maxHeight: 450)
                .clipped()
            
            HStack (spacing: 12){
                Button(action: {}, label: {
                    Image(systemName: "heart")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 20, height: 20)
                })
                
                Button(action: {}) {
                    Image(systemName: "bubble.right")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 20, height: 20)
                }
                
                Button(action: {}) {
                    Image(systemName: "paperplane")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 20, height: 20)
                }
            }
            .padding([.leading, .top], 10)
            .foregroundColor(.black)
            
            Text("\(post.likes) likes")
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(.black)
                .padding([.top, .bottom], 3)
                .padding(.leading, 10)
            
            HStack {
                Text(post.ownerUsername + " ")
                    .font(.system(size: 14, weight: .semibold)) +
                
                Text(post.caption)
                    .font(.system(size: 14, weight: .regular))
            }
            .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
            
            Text("2d")
                .font(.system(size: 14))
                .foregroundColor(.gray)
                .padding(.leading, 10)
                .padding(.top, -4)
            
            
            
            // post image
            
            // action buttons
            
            // caption
        }
    }
}
