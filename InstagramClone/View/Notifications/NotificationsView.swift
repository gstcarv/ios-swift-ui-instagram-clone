//
//  SearchView.swift
//  InstagramClone
//
//  Created by Gustavo Carvalho on 19/04/22.
//

import SwiftUI

struct NotificationView: View {
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 28) {
                ForEach(0 ..< 20) { _ in
                    NotificationCell()
                }
            }
            .padding(.horizontal, 18)
            .padding(.top, 20)
        }
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}
