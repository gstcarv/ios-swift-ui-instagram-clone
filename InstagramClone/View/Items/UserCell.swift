//
//  UserCell.swift
//  InstagramClone
//
//  Created by Gustavo Carvalho on 21/04/22.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        HStack {
            Image("ProfileImage")
                .resizable()
                .scaledToFill()
                .frame(width: 48, height: 48)
                .clipShape(Circle())
            
            VStack (alignment: .leading) {
                Text("steve.jobs")
                    .font(.system(size: 14, weight: .semibold))
                
                Text("Steve Jobs")
                    .font(.system(size: 14, weight: .regular))
                    .padding(.top, -8)
            }
            
            Spacer()

        }

    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell()
    }
}
