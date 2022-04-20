//
//  FeedCell.swift
//  InstagramClone
//
//  Created by Gustavo Carvalho on 19/04/22.
//

import SwiftUI

struct FeedCell: View {
    var body: some View {
        VStack(alignment: .leading) {
            
            // user information
            HStack {
                Image("ProfileImage")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 36, height: 36)
                    .clipped()
                    .cornerRadius(18)
                
                Text("Joker")
                    .font(.system(size: 14, weight: .semibold))
            }
            .padding(10)
            
            Image("PostImage")
                .resizable()
                .scaledToFill()
                .frame(maxHeight: 200)
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
            
            Text("2 likes")
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(.black)
                .padding([.top, .bottom], 3)
                .padding(.leading, 10)
            
            HStack {
                Text("batman")
                    .font(.system(size: 14, weight: .semibold)) +
                
                Text(" lorem ipsum dolor sit amet hello world this is my longer text yeee hello testing ok ok")
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

struct FeedCell_Previews: PreviewProvider {
    static var previews: some View {
        FeedCell()
    }
}
