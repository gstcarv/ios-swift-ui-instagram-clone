//
//  NotificationCell.swift
//  InstagramClone
//
//  Created by Gustavo Carvalho on 21/04/22.
//

import SwiftUI

struct NotificationCell: View {
    
    @State private var showPostImage = true
    
    var body: some View {
        HStack {
            Image("ProfileImage")
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
            
            Text("steve.jobs")
                .font(.system(size: 14, weight: .semibold, design: .default)) +
            
            Text(" liked your post")
                .font(.system(size: 14, weight: .regular))
            
            Spacer()
            
            if !showPostImage {
                Button(action: {}, label: {
                    Text("Follow")
                        .padding(.horizontal, 7)
                })
                    .buttonStyle(.bordered)
                    .background(.blue)
                    .clipShape(Capsule())
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.white)
            } else {
                Image("PostImage")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .cornerRadius(4)
            }
        }
    }
}

struct NotificationCell_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            NotificationCell()
            NotificationCell()
        }
    }
}
