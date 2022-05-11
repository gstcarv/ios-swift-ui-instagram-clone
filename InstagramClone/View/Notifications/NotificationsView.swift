//
//  SearchView.swift
//  InstagramClone
//
//  Created by Gustavo Carvalho on 19/04/22.
//

import SwiftUI

struct NotificationView: View {
    @ObservedObject var viewModel = NotificationsViewModel()
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 28) {
                ForEach(viewModel.notifications) { notification in
                    NotificationCell(notification: notification)
                }
            }
            .padding(.horizontal, 18)
            .padding(.top, 20)
        }
    }
}
