//
//  PostDetailsView.swift
//  InstagramClone
//
//  Created by Gustavo Carvalho on 02/05/22.
//

import SwiftUI

struct PostDetailsView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var viewModel: UploadPostViewModel;
    @Binding var selectedImage: UIImage?
    
    @Binding var selectedTab: MainTabs;
    @State var captionText = ""
    
    var body: some View {
        VStack {
            
            HStack (alignment: .top) {
                Image(uiImage: $selectedImage.wrappedValue ?? UIImage())
                    .resizable()
                    .scaledToFill()
                    .frame(width: 96, height: 96)
                    .clipped()
                
                TextArea(text: $captionText, placeholder: "Enter your caption")
                    .frame(height: 96, alignment: .leading)
                
            }.padding()
            
            Button(action: {
                viewModel.uploadPost(caption: captionText, image: selectedImage!) { _ in
                    captionText = ""
                    selectedImage = nil
                    selectedTab = .home
                    presentationMode.wrappedValue.dismiss()
                }
            }, label: {
                Text("Upload image")
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 50)
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }).padding(.horizontal, 15)
            
            Spacer()
        }
        .navigationTitle("Upload post")
        .tint(.black)
    }
    
}
