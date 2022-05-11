//
//  FeedCellViewModel.swift
//  InstagramClone
//
//  Created by Gustavo Carvalho on 03/05/22.
//

import Foundation

class FeedCellViewModel: ObservableObject {
    @Published var post: Post;
    
    init(post: Post) {
        self.post = post;
        
        checkIfUserLikedPost()
    }
    
    func like() {
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        
        post.userDidLike = true
        self.post.likes += 1
        
        FIRPostsCollection.document(post.id!).collection("post-likes")
            .document(uid).setData([:]) { error in
                if error != nil {
                    self.post.userDidLike = false
                    self.post.likes -= 1
                } else {
                    FIRPostsCollection.document(self.post.id!).updateData(["likes": self.post.likes])
                    
                    NotificationsViewModel.uploadNotification(toUid: self.post.ownerUid, type: .like, post: self.post)
                }
            }
    }
    
    func unlike() {
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        
        post.userDidLike = false
        self.post.likes -= 1
        
        FIRPostsCollection.document(post.id!).collection("post-likes")
            .document(uid).delete { error in
                if error != nil {
                    self.post.userDidLike = true
                    self.post.likes += 1
                }
                
                FIRPostsCollection.document(self.post.id!).updateData(["likes": self.post.likes])
            }
    }
    
    func checkIfUserLikedPost() {
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        
        FIRPostsCollection.document(post.id!).collection("post-likes")
            .document(uid).getDocument { snapshot, error in
                if snapshot?.exists == true {
                    self.post.userDidLike = true
                }
            }
    }
}
