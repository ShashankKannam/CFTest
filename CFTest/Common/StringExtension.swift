//
//  StringExtension.swift
//  CFTest
//
//  Created by Shashank Kannam on 9/18/19.
//  Copyright © 2019 sk. All rights reserved.
//

import Foundation

extension String {
    
    /// Gives formatted phone number - (XXX) XXX-XXXX
    var getFormattedPhoneNumber: String? {
        
        func getFormattedString(value: String) -> String? {
            var formattedString = ""
            guard value.count == 10 else { return nil }
            formattedString = "(" + value.prefix(3) + ") "
            let middleThree = value[3...5]
            let lastFour = value.suffix(4)
            formattedString = formattedString + middleThree + "-" + lastFour
            return formattedString
        }
        var acceptableCharacters = components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        if acceptableCharacters.count == 11, acceptableCharacters.hasPrefix("1"), let firstIndex = acceptableCharacters.firstIndex(of: "1") {
            acceptableCharacters = acceptableCharacters.substring(from: firstIndex)
            return getFormattedString(value: acceptableCharacters)
        }
        return getFormattedString(value: acceptableCharacters)
    }
    
    /// Gives substring within closed range
    ///
    /// - Parameter bounds: CountableClosedRange
    subscript (bounds: CountableClosedRange<Int>) -> Substring {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return self[start ... end]
    }
}


extension NSAttributedString {
    
    /// Gives range of search string
    ///
    /// - Parameter string: search string
    /// - Returns: range
    func rangeOf(string: String) -> Range<String.Index>? {
        return self.string.range(of: string)
    }
}
