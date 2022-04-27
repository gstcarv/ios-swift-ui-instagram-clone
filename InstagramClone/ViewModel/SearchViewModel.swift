//
//  SearchViewModel.swift
//  InstagramClone
//
//  Created by Gustavo Carvalho on 27/04/22.
//

import Foundation

class SearchViewModel: ObservableObject {
    
    @Published var users = [User]()
    
    init() {
        fetchUsers()
    }
    
    func fetchUsers() {
        FIRUsersCollection.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            
            self.users = documents.compactMap({ try? $0.data(as: User.self) })
        }
    }
    
    func filterUsers(search: String) -> [User] {
        let lowercased = search.lowercased()
        return users.filter({ $0.fullname.lowercased().contains(lowercased) || $0.username.lowercased().contains(lowercased) })
    }
    
}
