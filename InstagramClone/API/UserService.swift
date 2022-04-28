//
//  UserService.swift
//  InstagramClone
//
//  Created by Gustavo Carvalho on 28/04/22.
//

import Foundation

struct UserService {
    
    static func follow(uid: String, completion: @escaping (Error?) -> Void) {
        guard let currentUid = AuthViewModel.shared.userSession?.uid else { return }
        
        // Save data on following users from current user
        FIRFollowingCollection.document(currentUid)
            .collection("user-following")
            .document(uid)
            .setData([:]) { _ in
                
                // Save data on followers from the following user collection
                FIRFollowersCollection.document(uid)
                    .collection("user-followers")
                    .document(currentUid)
                    .setData([:], completion: completion)
            }
    }
    
    static func unfollow(uid: String, completion: @escaping (Error?) -> Void) {
        guard let currentUid = AuthViewModel.shared.userSession?.uid else { return }
        
        // Delete from following users
        FIRFollowingCollection.document(currentUid)
            .collection("user-following")
            .document(uid)
            .delete(){ _ in
                // Delete from followers
                FIRFollowersCollection.document(uid)
                    .collection("user-followers")
                    .document(currentUid)
                    .delete(completion: completion)
            }
    }
    
    static func checkIfUserIsFollowed(uid: String, completion: @escaping (Bool) -> Void) {
        guard let currentUid = AuthViewModel.shared.userSession?.uid else { return }
        
        // Get the following document
        FIRFollowingCollection.document(currentUid)
            .collection("user-following")
            .document(uid)
            .getDocument { snapshot, _ in
                guard let isFollowed = snapshot?.exists else { return }
                completion(isFollowed)
            }
    }
    
}
