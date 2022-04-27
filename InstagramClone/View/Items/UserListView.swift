//
//  UserListView.swift
//  InstagramClone
//
//  Created by Gustavo Carvalho on 21/04/22.
//

import SwiftUI

struct UserListView: View {
    
    @Binding var searchText: String
    @ObservedObject var viewModel: SearchViewModel;
    
    func getUsers() -> [User] {
        return searchText.isEmpty ? viewModel.users : viewModel.filterUsers(search: searchText)
    }
    
    var body: some View {
        ScrollView {
            LazyVStack (spacing: 10) {
                ForEach(getUsers()) { user in
                    NavigationLink(destination: ProfileView()) {
                        UserCell(user: user)
                            .padding(.vertical, 5)
                    }
                }
            }
            .padding([.horizontal], 18)
        }
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView(
            searchText: .constant(""),
            viewModel: SearchViewModel()
        )
    }
}
