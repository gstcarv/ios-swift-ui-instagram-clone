//
//  LoginView.swift
//  InstagramClone
//
//  Created by Gustavo Carvalho on 25/04/22.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                
                LinearGradient(
                    gradient: Gradient(
                        colors: [Color.purple, Color.blue]
                    ),
                    startPoint: .top,
                    endPoint: .bottom
                ).ignoresSafeArea()
                
                VStack {
                    Image("InstagramLogo_white")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 80, alignment: .center)
                    
                    VStack {
                        CustomTextField(text: $email, placeholder: "Email", icon: "envelope")
                        CustomSecureField(text: $password, placeholder: "Password")
                            .padding(.top, 10)
                    }
                    .padding(.horizontal, 30)
                    .padding(.top, 15)
                    
                    HStack {
                        Spacer()
                        
                        Button(action: {}) {
                            Text("Forgot Password?")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .semibold))
                        }
                    }
                    .padding(.horizontal, 30)
                    .padding(.vertical, 20)
                    
        
                    Button(action: {
                        AuthViewModel.shared.login(email: email, password: password)
                    }) {
                        Text("Sign In")
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 10)
                            .font(.system(size: 14, weight: .semibold))
                            .padding(15)
                            .foregroundColor(.blue)
                            .background(.white)
                            .cornerRadius(100)
                    }
                    .padding(.horizontal, 30)
                    
                    Spacer()
                    
                    NavigationLink(
                        destination: RegistrationView()
                    ) {
                        Text("Don't have an account?")
                            .font(.system(size: 14, weight: .regular))
                            .foregroundColor(.white) +
                        
                        Text(" Sign Up")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.white)
                    }
                    .padding(.bottom, 15)
                }
            }
            .padding(.top, -22)
            .navigationBarTitleDisplayMode(.inline)
        }
        .accentColor(.white)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
