//
//  UploadPostView.swift
//  InstagramClone
//
//  Created by Gustavo Carvalho on 19/04/22.
//

import SwiftUI

struct UploadPostView: View {
    
    @Binding var selectedTab: MainTabs;
    
    @State var selectedImage: UIImage?
    @State var showImagePicker = false;
    
    @ObservedObject var viewModel = UploadPostViewModel()
    
    @State var showDetailsView: Bool = false;
    
    var body: some View {
        VStack {
            VStack (alignment: .leading) {
                Button(action: { showImagePicker.toggle() }, label: {
                    Text("Upload image")
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 50)
                        .background(.black)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                })
                    .padding()
                    .sheet(
                        isPresented: $showImagePicker,
                        onDismiss: loadImage,
                        content: {
                            ImagePicker(image: $selectedImage)
                        })
            }
            
            NavigationLink(destination:
               PostDetailsView(
                    viewModel: viewModel,
                    selectedImage: $selectedImage,
                    selectedTab: $selectedTab
               ),
               isActive: $showDetailsView) {
                 EmptyView()
            }.hidden()

            
            Spacer()
        }
    }
}

extension UploadPostView {
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
    
        showDetailsView = true
    }
}
