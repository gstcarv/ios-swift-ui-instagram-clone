//
//  NotificationsViewModel.swift
//  InstagramClone
//
//  Created by Gustavo Carvalho on 11/05/22.
//

import Foundation
import Firebase

class NotificationsViewModel: ObservableObject {
    @Published var notifications = [Notification]()
    
    init () {
        fetchNotifications()
    }
    
    func fetchNotifications() {
        guard let user = AuthViewModel.shared.currentUser else { return }
        
        let query = FIRNotificationsCollection.document(user.id!).collection("user-notifications")
            .order(by: "timestamp", descending: true)
        
        query.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            
            self.notifications = documents.compactMap({ try! $0.data(as: Notification.self) })            
        }
    }
    
    static func uploadNotification(toUid uid: String, type: NotificationType, post: Post? = nil) {
        guard let user = AuthViewModel.shared.currentUser else { return }

        var data: [String: Any] = [
            "timestamp": Timestamp(date: Date()),
            "username": user.username,
            "uid": user.id ?? "",
            "profileImageUrl": user.profileImageUrl,
            "type": type.rawValue
        ]
        
        if let post = post, let id = post.id {
            data["postId"] = id
        }
        
        FIRNotificationsCollection.document(uid).collection("user-notifications").addDocument(data: data)
    }
}
