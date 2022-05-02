//
//  FirebaseConstants.swift
//  InstagramClone
//
//  Created by Gustavo Carvalho on 27/04/22.
//

import Firebase

let FIRUsersCollection = Firestore.firestore().collection("users")

let FIRFollowersCollection = Firestore.firestore().collection("followers")

let FIRFollowingCollection = Firestore.firestore().collection("following")

let FIRPostsCollection = Firestore.firestore().collection("posts")
