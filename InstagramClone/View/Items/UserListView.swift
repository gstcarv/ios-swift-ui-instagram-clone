//
//  UserListView.swift
//  InstagramClone
//
//  Created by Gustavo Carvalho on 21/04/22.
//

import SwiftUI

struct UserListView: View {
    var body: some View {
        ScrollView {
            LazyVStack (spacing: 10) {
                ForEach(0 ..< 20) { _ in
                    UserCell()
                }
            }
            .padding([.horizontal], 24)
        }
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView()
    }
}
