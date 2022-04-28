//
//  ProfileViewModel.swift
//  InstagramClone
//
//  Created by Gustavo Carvalho on 28/04/22.
//

import Foundation

class ProfileViewModel: ObservableObject {
    @Published var user: User;
    
    init (user: User) {
        self.user = user;
        
        checkIfUserIsFollowed()
    }
    
    func follow() {
        guard let uid = user.id else { return }
        
        self.user.isFollowedByCurrentUser = true
        
        UserService.follow(uid: uid) { error in
            if error != nil {
                self.user.isFollowedByCurrentUser = false
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

}
