//
//  ArrayExtension.swift
//  CFTest
//
//  Created by Shashank Kannam on 9/18/19.
//  Copyright © 2019 sk. All rights reserved.
//

import Foundation

extension Array {
    
    /// Gives element if exists in array
    ///
    /// - Parameter index: index
    subscript(safe index: Int) -> Element? {
        return indices ~= index ? self[index] : nil
    }
}
