//
//  LoginView.swift
//  InstagramClone
//
//  Created by Gustavo Carvalho on 25/04/22.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject var viewModel: LoginViewModel = LoginViewModel();
    
    @State private var email = ""
    @State private var password = ""
    
    init() {
        let navigationBarAppearence = UINavigationBarAppearance()
        
        navigationBarAppearence.configureWithTransparentBackground()
        navigationBarAppearence.backgroundColor = UIColor(named: "transparent")
        
        UINavigationBar.appearance().compactAppearance = navigationBarAppearence
        UINavigationBar.appearance().standardAppearance = navigationBarAppearence
        UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearence
    }
    
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
                    
        
                    CustomButton(
                        action: {
                            viewModel.login(email: email, password: password)
                        },
                        label: {
                            Text("Sign In")
                                .font(.system(size: 14, weight: .semibold))
                        },
                        loading: viewModel.isLogging
                    )
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 10)
                    .padding(15)
                    .foregroundColor(.blue)
                    .background(.white)
                    .cornerRadius(100)
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
        .preferredColorScheme(.dark)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
