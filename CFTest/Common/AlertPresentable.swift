//
//  AlertPresentable.swift
//  CFTest
//
//  Created by Shashank Kannam on 9/18/19.
//  Copyright © 2019 sk. All rights reserved.
//

import UIKit

protocol AlertPresentable {
    
    /// Shows alert with OK button
    ///
    /// - Parameters:
    ///   - message: alert message
    ///   - title: alert title
    func showBasicAlert(message: String, title: String)
}

extension AlertPresentable where Self: UIViewController {
    
    func showBasicAlert(message: String, title: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
