//
//  UserCell.swift
//  InstagramClone
//
//  Created by Gustavo Carvalho on 21/04/22.
//

import SwiftUI
import Kingfisher

struct UserCell: View {
    let user: User;
    
    var body: some View {
        HStack {
            KFImage(URL(string: user.profileImageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: 48, height: 48)
                .clipShape(Circle())
            
            VStack (alignment: .leading) {
                Text(user.username)
                    .font(.system(size: 14, weight: .semibold))
                
                Text(user.fullname)
                    .font(.system(size: 14, weight: .regular))
                    .padding(.top, -8)
            }
            
            Spacer()

        }

    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell(
            user: User(id: "123", username: "john.doe", email: "john.doe", profileImageUrl: "ProfileImage", fullname: "Steve Jobs")
        )
    }
}
