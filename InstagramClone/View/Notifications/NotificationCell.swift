//
//  NotificationCell.swift
//  InstagramClone
//
//  Created by Gustavo Carvalho on 21/04/22.
//

import SwiftUI
import Kingfisher

struct NotificationCell: View {
    
    @ObservedObject var viewModel: NotificationCellViewModel
    
    init (notification: Notification) {
        viewModel = NotificationCellViewModel(notification: notification)
    }
    
    private var notification: Notification { return viewModel.notification }
    private var showPostImage: Bool { return notification.type != .follow }
    
    private var isFollowed: Bool { return notification.userIsFollowed ?? false }
    
    var body: some View {
        HStack {
            KFImage(URL(string: notification.profileImageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
            
            Text(notification.username)
                .font(.system(size: 14, weight: .semibold, design: .default)) +
            
            Text(notification.type.notificationMessage)
                .font(.system(size: 14, weight: .regular))
            
            Spacer()
            
            if !showPostImage {
                Button(action: {
                    if (isFollowed) {
                        viewModel.unfollow()
                    } else {
                        viewModel.follow()
                    }
                }) {
                    Text(isFollowed ? "Following" : "Follow")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(isFollowed ? .black : .white)
                        .frame(minWidth: 0, maxWidth: 130, minHeight: 32)
                        .background(isFollowed ? .white : .blue)
                        .overlay(
                            RoundedRectangle(cornerRadius: 3)
                                .stroke(Color.gray, lineWidth: isFollowed ? 1 : 0)
                        )
                        .cornerRadius(3)
                }
            } else {
                KFImage(URL(string: viewModel.notification.post?.imageUrl ?? ""))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .cornerRadius(4)
            }
        }
    }
}
