//
//  UIApplication+Ext.swift
//  GithubUsers App
//
//  Created by Ahmed Ali on 18/04/2025.
//

import UIKit

// Extension to add custom functionality to UIApplication
extension UIApplication {
    
    // Ends editing by resigning the first responder (hides the keyboard)
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
