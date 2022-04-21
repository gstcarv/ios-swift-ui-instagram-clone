//
//  SearchView.swift
//  InstagramClone
//
//  Created by Gustavo Carvalho on 19/04/22.
//

import SwiftUI

struct SearchView: View {
    
    @State var searchText = ""
    @State var isSearching = false
    
    var body: some View {
        ScrollView {
            SearchBar(text: $searchText, isEditing: $isSearching)
                .padding([.horizontal, .vertical], 15)

            ZStack {
                if isSearching {
                    UserListView()
                } else {
                    PostGridView()
                }
            }
            
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
