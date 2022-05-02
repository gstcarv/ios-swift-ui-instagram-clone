//
//  ImageUploader.swift
//  InstagramClone
//
//  Created by Gustavo Carvalho on 26/04/22.
//

import Foundation
import UIKit
import Firebase

enum UploadType {
    case profile
    case post
    
    var filePath: StorageReference {
        let filename = UUID().uuidString
        
        switch self {
        case .profile:
            return Storage.storage().reference(withPath: "/profile_images/\(filename)")
        case .post:
            return Storage.storage().reference(withPath: "/post_images/\(filename)")
        }
    }
}

struct ImageUploader {
    static func uploadImage(image: UIImage, type: UploadType, completion: @escaping (String) -> Void) {
        guard let imageData = image.jpegData(compressionQuality: 0.7) else { return }

        let storageRef = type.filePath
        
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
