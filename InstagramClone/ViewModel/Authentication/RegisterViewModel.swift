//
//  LoginViewModel.swift
//  InstagramClone
//
//  Created by Gustavo Carvalho on 16/05/22.
//

import Foundation
import UIKit

class RegisterViewModel: ObservableObject {
    @Published var isRegistering: Bool = false;
    
    func register(email: String, password: String, username: String, fullname: String, photo: UIImage?) {
        guard let photo = photo else { return }
        
        isRegistering = true
        
        AuthViewModel.shared.register(
            email: email,
            password: password,
            username: username,
            fullname: fullname,
            photo: photo
        ) {
            self.isRegistering = false
        }

    }
    
}
