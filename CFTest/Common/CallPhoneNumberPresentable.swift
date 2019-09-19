//
//  CallPhoneNumberPresentable.swift
//  CFTest
//
//  Created by Shashank Kannam on 9/18/19.
//  Copyright © 2019 sk. All rights reserved.
//

import UIKit

protocol CallPhoneNumberPresentable {
    
   /// Opens caller tuner
   ///
   /// - Parameter phoneNumber: phone number to call
   func call(phoneNumber: String)
}

extension CallPhoneNumberPresentable {
    func call(phoneNumber: String) {
        if let url = URL(string: "tel://\(phoneNumber)"), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}
