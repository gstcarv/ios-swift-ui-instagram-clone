//
//  ProfileView.swift
//  InstagramClone
//
//  Created by Gustavo Carvalho on 19/04/22.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ScrollView {
            VStack (spacing: 32) {
                ProfileHeaderView().padding(.top, 16)
                PostGridView()
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
