//
//  Comment.swift
//  InstagramClone
//
//  Created by Gustavo Carvalho on 06/05/22.
//

import Foundation
import FirebaseFirestoreSwift
import Firebase

struct Comment: Codable, Identifiable {
    internal init(username: String, profileImageUrl: String, uid: String, timestamp: Timestamp, postOwnerUid: String, commentText: String) {
        self.username = username
        self.profileImageUrl = profileImageUrl
        self.uid = uid
        self.timestamp = timestamp
        self.postOwnerUid = postOwnerUid
        self.commentText = commentText
    }
    
    @DocumentID var id: String?
    let username: String
    let profileImageUrl: String
    let uid: String
    let timestamp: Timestamp
    let postOwnerUid: String
    let commentText: String
    
    
}
