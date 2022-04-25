//
//  ProfileActionButtons.swift
//  InstagramClone
//
//  Created by Gustavo Carvalho on 22/04/22.
//

import SwiftUI

struct ProfileActionButtons: View {
    
    var isCurrentUser: Bool;
    
    var body: some View {
        if isCurrentUser {
            Button(action: {}) {
                Text("Edit Profile")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.black)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 32)
                    .overlay(
                        RoundedRectangle(cornerRadius: 3)
                            .stroke(Color.gray, lineWidth: 0.5)
                    )
            }
        } else {
            
            HStack {
                Button(action: {}) {
                    Text("Follow")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(.white)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 32)
                        .background(.blue)
                        .cornerRadius(3)
                }
                
                Button(action: {}) {
                    Text("Message")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(.black)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 32)
                        .overlay(
                            RoundedRectangle(cornerRadius: 3)
                                .stroke(Color.gray, lineWidth: 0.5)
                        )
                }
            }

        }
    }
}

struct ProfileActionButtons_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ProfileActionButtons(isCurrentUser: true)
            ProfileActionButtons(isCurrentUser: false)
        }
    }
}
