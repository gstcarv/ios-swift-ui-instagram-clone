//
//  RegistrationView.swift
//  InstagramClone
//
//  Created by Gustavo Carvalho on 25/04/22.
//

import SwiftUI

struct RegistrationView: View {
    
    @Environment(\.presentationMode) var presentation
    
    @State private var email = ""
    @State private var password = ""
    @State private var fullname = ""
    @State private var username = ""
    
    @State var showPhotoPicker = false;
    @State var selectedProfilePhoto: UIImage?;
    
    @ObservedObject var viewModel: RegisterViewModel = RegisterViewModel()
    
    var body: some View {
        ZStack {
            
            LinearGradient(
                gradient: Gradient(
                    colors: [Color.purple, Color.blue]
                ),
                startPoint: .top,
                endPoint: .bottom
            ).ignoresSafeArea()
            
            VStack {
                
                Button(action: { showPhotoPicker.toggle() }) {
                    Image(uiImage: ($selectedProfilePhoto.wrappedValue ?? UIImage(named: "UserProfileSelector")!))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 170, height: 170)
                        .clipped()
                        .clipShape(Circle())
                }
                .sheet(isPresented: $showPhotoPicker, onDismiss: {}, content: {
                    ImagePicker(image: $selectedProfilePhoto)
                })
                
                VStack (spacing: 15) {
                    CustomTextField(text: $email, placeholder: "Email", icon: "envelope")
                    
                    CustomTextField(text: $username, placeholder: "Username", icon: "person")
                    
                    CustomTextField(text: $fullname, placeholder: "Full Name", icon: "person")
                    
                    CustomSecureField(text: $password, placeholder: "Password")
                }
                .padding(.horizontal, 30)
                .padding(.top, 15)
                .padding(.bottom, 25)
                
                CustomButton(
                    action: {
                        viewModel.register(
                            email: email,
                            password: password,
                            username: username,
                            fullname: fullname,
                            photo: selectedProfilePhoto!)
                    },
                    label: {
                        Text("Sign Up")
                            .font(.system(size: 14, weight: .semibold))
                    },
                    loading: viewModel.isRegistering
                )
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 10)
                .padding(15)
                .foregroundColor(.blue)
                .background(.white)
                .cornerRadius(100)
                .padding(.horizontal, 30)
                
                Spacer()
                
                Button(
                    action: {
                        presentation.wrappedValue.dismiss()
                    }
                ) {
                    Text("Already have an account?")
                        .font(.system(size: 14, weight: .regular))
                        .foregroundColor(.white) +
                    
                    Text(" Sign In")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(.white)
                }
                .padding(.bottom, 15)
            }
        }
    }
}

