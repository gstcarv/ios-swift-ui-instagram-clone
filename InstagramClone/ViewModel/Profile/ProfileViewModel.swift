//
//  ProfileViewModel.swift
//  InstagramClone
//
//  Created by Gustavo Carvalho on 28/04/22.
//

import Foundation

class ProfileViewModel: ObservableObject {
    @Published var user: User
    @Published var posts = [Post]()
    @Published var userStats: UserStats = UserStats(following: 0, posts: 0, followers: 0)
    
    init (user: User) {
        self.user = user
        
        checkIfUserIsFollowed()
        fetchUserStats()
    }
    
    func follow() {
        guard let uid = user.id else { return }
        
        self.user.isFollowedByCurrentUser = true
        
        UserService.follow(uid: uid) { error in
            if error != nil {
                self.user.isFollowedByCurrentUser = false
            } else {
                NotificationsViewModel.uploadNotification(toUid: uid, type: .follow)
            }
        }
    }
    
    func unfollow() {
        guard let uid = user.id else { return }
        
        self.user.isFollowedByCurrentUser = false
        
        UserService.unfollow(uid: uid) { error in
            if error != nil {
                self.user.isFollowedByCurrentUser = true
            }
        }
    }
    
    func checkIfUserIsFollowed() {
        
        // Don`t check if the user the current user
        guard !user.isCurrentUser else { return }
        
        guard let uid = user.id else { return }
        
        UserService.checkIfUserIsFollowed(uid: uid) { isFollowed in
            self.user.isFollowedByCurrentUser = isFollowed
        }
    }
    
    func fetchUserStats () {
        guard let uid = user.id else { return }
        
        FIRFollowingCollection.document(uid).collection("user-following").getDocuments { snapshot, Error in
            guard let following = snapshot?.documents.count else { return }
            
            FIRFollowersCollection.document(uid).collection("user-followers").getDocuments { snapshot, Error in
                guard let followers = snapshot?.documents.count else { return }
                
                FIRPostsCollection.whereField("ownerUid", isEqualTo: uid).getDocuments { snapshot, Error in
                    guard let posts = snapshot?.documents.count else { return }
                    
                    self.userStats = UserStats(following: following, posts: posts, followers: followers)
                }
            }
        }
    }
}
