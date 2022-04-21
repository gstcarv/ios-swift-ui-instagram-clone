//
//  Extensions.swift
//  InstagramClone
//
//  Created by Gustavo Carvalho on 21/04/22.
//

import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
