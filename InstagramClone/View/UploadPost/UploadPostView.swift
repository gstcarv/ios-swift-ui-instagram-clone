//
//  UploadPostView.swift
//  InstagramClone
//
//  Created by Gustavo Carvalho on 19/04/22.
//

import SwiftUI

struct UploadPostView: View {
    
    @State var selectedImage: UIImage?
    @State var captionText = ""
    @State var showImagePicker = false;
    
    var body: some View {
        VStack {
            if (selectedImage == nil) {
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
            } else {
                HStack (alignment: .top) {
                    Image(uiImage: $selectedImage.wrappedValue!)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 96, height: 96)
                        .clipped()
                    
                    TextField("Enter the caption...", text: $captionText)
                        .frame(height: 96, alignment: .leading)
                        .multilineTextAlignment(.leading)
                    
                }.padding()
                
                Button(action: {}, label: {
                    Text("Upload image")
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 50)
                        .background(.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }).padding(.horizontal, 15)
               
            }
            
            Spacer()
        }
    }
}

extension UploadPostView {
    func loadImage() {
        
        print("image was selected")
        
        guard let selectedImage = selectedImage else { return }
    
        print(selectedImage.size)
    }
}

struct UploadPostView_Previews: PreviewProvider {
    static var previews: some View {
        UploadPostView()
    }
}
