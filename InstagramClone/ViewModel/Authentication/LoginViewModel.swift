//
//  LoginViewModel.swift
//  InstagramClone
//
//  Created by Gustavo Carvalho on 16/05/22.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var isLogging: Bool = false;
    
    func login(email: String, password: String) {
        self.isLogging = true
        
        AuthViewModel.shared.login(email: email, password: password) {
            self.isLogging = false
        }
    }

}
