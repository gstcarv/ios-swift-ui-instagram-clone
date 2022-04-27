//
//  User.swift
//  InstagramClone
//
//  Created by Gustavo Carvalho on 27/04/22.
//

import Foundation
import FirebaseFirestoreSwift

struct User: Decodable {
    @DocumentID var id: String?
    let username: String
    let email: String
    let profileImageUrl: String
    let fullname: String
}
