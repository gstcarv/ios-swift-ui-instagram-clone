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
    
    static let shared = AuthViewModel()
    
    init () {
        userSession = Auth.auth().currentUser
    }
    
    func login(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                return print(error.localizedDescription)
            }
            
            guard let user = result?.user else { return }
            
            self.userSession = user;
        }
    }
    
    func register(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                return print(error.localizedDescription)
            }
            
            guard let user = result?.user else { return }
            
            self.userSession = user;
            
            print("user registered...")
        }
    }
    
    func signOut() {
        self.userSession = nil
        try? Auth.auth().signOut()
    }
    
    func fetchUser() {
        
    }
    
}


