//
//  AuthViewModel.swift
//  InstagramClone
//
//  Created by Gustavo Carvalho on 26/04/22.
//

import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
    
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    static let shared = AuthViewModel()
    
    init () {
        userSession = Auth.auth().currentUser
        fetchUser()
    }
    
    func login(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                return print(error.localizedDescription)
            }
            
            guard let user = result?.user else { return }
            
            self.userSession = user;
            
            self.fetchUser()
        }
    }
    
    func register(email: String, password: String, username: String, fullname: String, photo: UIImage?) {
        
        guard let photo = photo else { return }
        
        // Try to send profile picture to storage
        ImageUploader.uploadImage(image: photo, type: .profile) { photoURL in
            
            // Try to create user on auth
            Auth.auth().createUser(withEmail: email, password: password) { result, error in
                if let error = error {
                    return print(error.localizedDescription)
                }
                
                guard let user = result?.user else { return }
                
                // Saves the created user on Firestore
                let userData = [
                    "email": email,
                    "username": username,
                    "fullname": fullname,
                    "profileImageUrl": photoURL,
                    "uid": user.uid
                ]
                
                FIRUsersCollection.document(user.uid).setData(userData) { _ in
                    // Set the user session
                    self.userSession = user;
                }
                
                self.fetchUser()
            }
        }

    }
    
    func signOut() {
        self.userSession = nil
        try? Auth.auth().signOut()
    }
    
    func fetchUser() {
        
        if userSession == nil {
            return
        }
        
        FIRUsersCollection.document(userSession!.uid).getDocument { snapshot, _ in
            guard let user = try? snapshot?.data(as: User.self) else { return }
            self.currentUser = user;
        }
    }
    
}


