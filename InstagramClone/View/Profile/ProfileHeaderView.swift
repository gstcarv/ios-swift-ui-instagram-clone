//
//  ProfileHeaderView.swift
//  InstagramClone
//
//  Created by Gustavo Carvalho on 22/04/22.
//

import SwiftUI
import Kingfisher

struct ProfileHeaderView: View {
    
    var user: User;
    
    var body: some View {
        VStack {
            HStack {
                KFImage(URL(string: user.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 82, height: 82)
                    .clipShape(Circle())
                
                Spacer()

                HStack {
                    UserStatView(title: "Posts", value: .constant(10))
                    UserStatView(title: "Followers", value: .constant(1000))
                    UserStatView(title: "Following", value: .constant(20))
                }
            }
            
            VStack(alignment: .leading) {
                Text(user.fullname)
                    .font(.system(size: 16, weight: .semibold))
                    .padding(.top, 10)
                
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam ac eros elit.")
                    .font(.system(size: 16, weight: .regular))
                    .padding(.top, -3)
            }
            
            ProfileActionButtons(isCurrentUser: user.isCurrentUser)
            
        }
        .padding(.horizontal, 20)
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView(
            user: User(id: "123", username: "john.doe", email: "john.doe", profileImageUrl: "ProfileImage", fullname: "Steve Jobs")
        )
    }
}
