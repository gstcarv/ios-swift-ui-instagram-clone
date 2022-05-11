//
//  Notification.swift
//  InstagramClone
//
//  Created by Gustavo Carvalho on 11/05/22.
//

import Foundation
import FirebaseFirestoreSwift
import Firebase

struct Notification: Identifiable, Decodable {
    @DocumentID var id: String?
    var postId: String?
    let username: String
    let profileImageUrl: String
    let timestamp: Timestamp
    let type: NotificationType
    let uid: String
    
    var userIsFollowed: Bool?
    var post: Post?
    var user: User?
}

enum NotificationType: Int, Decodable {
    case like
    case comment
    case follow
    
    var notificationMessage: String {
        switch self {
        case .like: return " liked one of yout posts."
        case .comment: return " commented on one of yout posts."
        case .follow: return " started following you"
        }
    }
}
