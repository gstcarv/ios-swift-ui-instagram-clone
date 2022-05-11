//
//  NotificationCellViewModel.swift
//  InstagramClone
//
//  Created by Gustavo Carvalho on 11/05/22.
//

import Foundation

class NotificationCellViewModel: ObservableObject {
    @Published var notification: Notification
    
    init(notification: Notification) {
        self.notification = notification
        
        checkIfUserIsFollowed()
        fetchNotificationPost()
    }
    
    func follow() {
        let uid = notification.uid
        
        self.notification.userIsFollowed = true
        
        UserService.follow(uid: uid) { error in
            if error != nil {
                self.notification.userIsFollowed = false
            } else {
                NotificationsViewModel.uploadNotification(toUid: uid, type: .follow)
            }
        }
    }
    
    func unfollow() {
        let uid = notification.uid
        
        self.notification.userIsFollowed = false
        
        UserService.unfollow(uid: uid) { error in
            if error != nil {
                self.notification.userIsFollowed = true
            }
        }
    }
    
    func checkIfUserIsFollowed() {
        guard notification.type == .follow else { return }
        
        let uid = notification.uid
        
        UserService.checkIfUserIsFollowed(uid: uid) { isFollowed in
            self.notification.userIsFollowed = isFollowed
        }
    }
    
    func fetchNotificationPost() {
        guard let postId = notification.postId else { return }
        
        FIRPostsCollection.document(postId).getDocument { snapshot, error in
            self.notification.post = try? snapshot?.data(as: Post.self)
        }
    }
    
}
