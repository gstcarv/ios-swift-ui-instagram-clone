//
//  CommentVIewModel.swift
//  InstagramClone
//
//  Created by Gustavo Carvalho on 06/05/22.
//

import Foundation
import Firebase

class CommentViewModel: ObservableObject {
    
    private let post: Post;
    
    @Published var comments = [Comment]()
    @Published var postCaptionComment: Comment;
    
    init(post: Post) {
        self.post = post
        
        let captionComment = Comment(
            username: post.ownerUsername,
            profileImageUrl: post.ownerImageUrl,
            uid: post.ownerUid,
            timestamp: post.timestamp,
            postOwnerUid: post.ownerUid,
            commentText: post.caption
        )
       
        self.postCaptionComment = captionComment
        
        fetchComments()
    }
    
    func uploadComment(commentText: String) {
        guard let user = AuthViewModel.shared.currentUser else { return }
        
        let data = [
            "username": user.username,
            "profileImageUrl": user.profileImageUrl,
            "uid": user.id!,
            "timestamp": Timestamp(date: Date()),
            "postOwnerUid": post.ownerUid,
            "commentText": commentText
        ] as [String : Any]
        
        FIRPostsCollection.document(post.id!).collection("comments").addDocument(data: data) { error in
            if error == nil {
                NotificationsViewModel.uploadNotification(toUid: self.post.ownerUid, type: .comment, post: self.post)
            }
        }
        
        var comment = Comment(
            username: user.username,
            profileImageUrl: user.profileImageUrl,
            uid: user.id!,
            timestamp: Timestamp(date: Date()),
            postOwnerUid: post.ownerUid,
            commentText: commentText
        )
        
        comment.id = UUID().uuidString
        
        comments.insert(comment, at: 0)
    }
    
    func fetchComments() {
        FIRPostsCollection.document(post.id!).collection("comments").getDocuments { snapshot, error in
            guard let data = snapshot?.documents else { return };
            
            self.comments = data.compactMap({ try? $0.data(as: Comment.self) })
        }
    }
    
}
