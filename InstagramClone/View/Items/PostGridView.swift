//
//  PostGridView.swift
//  InstagramClone
//
//  Created by Gustavo Carvalho on 20/04/22.
//

import SwiftUI

struct PostGridView: View {
    private let items = [GridItem(), GridItem(), GridItem()]
    private let width = UIScreen.main.bounds.width / 3
    
    var body: some View {
        LazyVGrid(columns: items, spacing: 2) {
            ForEach(0 ..< 12) { _ in
                Image("PostImage")
                    .resizable()
                    .scaledToFill()
                    .frame(width: width, height: width)
                .clipped()
            }
        }
    }
}

struct PostGridView_Previews: PreviewProvider {
    static var previews: some View {
        PostGridView()
    }
}
