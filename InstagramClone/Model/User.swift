//
//  User.swift
//  InstagramClone
//
//  Created by Gustavo Carvalho on 27/04/22.
//

import Foundation
import FirebaseFirestoreSwift

struct User: Identifiable, Decodable {
    @DocumentID var id: String?
    let username: String
    let email: String
    let profileImageUrl: String
    let fullname: String
    
    var isFollowedByCurrentUser: Bool? = false;
    
    var isCurrentUser: Bool { return AuthViewModel.shared.userSession?.uid == id }
}

struct UserStats {
    var following: Int
    var posts: Int
    var followers: Int
}
