//
//  ProfileView.swift
//  InstagramClone
//
//  Created by Gustavo Carvalho on 19/04/22.
//

import SwiftUI

struct ProfileView: View {
    
    @ObservedObject var viewModel: ProfileViewModel
    
    init(user: User) {
        viewModel = ProfileViewModel(user: user);
    }
    
    var body: some View {
        ScrollView {
            VStack (spacing: 32) {
                ProfileHeaderView(viewModel: viewModel)
                    .padding(.top, 16)
                PostGridView(config: .profile(viewModel.user.id ?? ""))
            }
        }
    }
}
