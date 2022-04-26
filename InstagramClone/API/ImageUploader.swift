//
//  ImageUploader.swift
//  InstagramClone
//
//  Created by Gustavo Carvalho on 26/04/22.
//

import Foundation
import UIKit
import Firebase

struct ImageUploader {
    static func uploadImage(image: UIImage, completion: @escaping (String) -> Void) {
        guard let imageData = image.jpegData(compressionQuality: 0.7) else { return }
        let filename = UUID().uuidString
        
        let storageRef = Storage.storage().reference(withPath: "/profile_images/\(filename)")
        
        storageRef.putData(imageData, metadata: nil) { _, error in
            if error != nil {
                return print("Error occurs uploading image " + error!.localizedDescription)
            }
            
            storageRef.downloadURL { url, _ in
                guard let imageUrl = url?.absoluteString else { return }
                completion(imageUrl)
            }
        }
    }
}
