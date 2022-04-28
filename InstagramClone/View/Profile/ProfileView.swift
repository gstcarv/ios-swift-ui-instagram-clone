//
//  ProfileView.swift
//  InstagramClone
//
//  Created by Gustavo Carvalho on 19/04/22.
//

import SwiftUI

struct ProfileView: View {
    
    var user: User;
    
    var body: some View {
        ScrollView {
            VStack (spacing: 32) {
                ProfileHeaderView(user: user)
                    .padding(.top, 16)
                PostGridView()
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(
            user: User(id: "123", username: "john.doe", email: "john.doe", profileImageUrl: "ProfileImage", fullname: "Steve Jobs")
        )
    }
}
