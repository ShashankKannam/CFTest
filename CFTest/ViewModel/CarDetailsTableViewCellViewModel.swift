//
//  CarDetailsTableViewCellViewModel.swift
//  CFTest
//
//  Created by Shashank Kannam on 9/18/19.
//  Copyright © 2019 sk. All rights reserved.
//

import UIKit

protocol CFCommonTableViewCellConfigurable: CallPhoneNumberPresentable { }

protocol CarDetailsTableViewCellConfigurable: CFCommonTableViewCellConfigurable {
    var carModelText: String? { get }
    var carDetailsText: NSAttributedString? { get }
    var dealerPhoneNumber: String? { get }
    var carImageURL: String? { get }
}

class CarDetailsTableViewCellViewModel: CarDetailsTableViewCellConfigurable {
    
    var carModelText: String?
    var carDetailsText: NSAttributedString?
    var dealerPhoneNumber: String?
    var carImageURL: String?
    
    init(carListing: Listings) {
        setCarModelDetails(carListing: carListing)
        setCarDetailsData(carListing: carListing)
        if let phoneNumber = carListing.dealer?.phone {
            dealerPhoneNumber = phoneNumber.getFormattedPhoneNumber ?? ""
        }
        
        if let imageUrl = carListing.images?.firstPhoto?.large {
            carImageURL = imageUrl
        }
    }
    
    fileprivate func setCarModelDetails(carListing: Listings) {
        let year = carListing.year?.description ?? ""
        let make = carListing.make ?? ""
        let model = carListing.model ?? ""
        carModelText =  getJoinedString(args: year, make, model, seperator: " ")
    }
    
    fileprivate func setCarDetailsData(carListing: Listings) {
        var price: String?
        var carDetailsTexts: [String] = []
        if let priceIn = carListing.listPrice, let formattedPrice = getCurrency(price: priceIn) {
            price = formattedPrice
            carDetailsTexts.append(formattedPrice)
        }
        if let mileageIn = carListing.mileage {
            var formattedString =  mileageIn > 1000 ? (mileageIn.description.substring(to: mileageIn.description.index(mileageIn.description.endIndex, offsetBy: -3)) + "k") : mileageIn.description
            formattedString += " Mi"
            carDetailsTexts.append(formattedString)
        }
        if let dealer = carListing.dealer, let city = dealer.city, let state = dealer.state {
            let formattedAddress = getJoinedString(args: city, state, seperator: ", ")
            carDetailsTexts.append(formattedAddress)
        }
        let carDetailsFormattedText = NSMutableAttributedString(string: getJoinedString(argsA: carDetailsTexts, seperator: " | "))
        if let priceIn = price {
            let priceTextRange = carDetailsFormattedText.mutableString.range(of: priceIn, options: .caseInsensitive)
            carDetailsFormattedText.addAttribute(NSAttributedString.Key.font, value: UIFont.boldSystemFont(ofSize: 15), range: priceTextRange)
        }
        carDetailsText = carDetailsFormattedText
    }
    
    fileprivate func getCurrency(price: Int) -> String? {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currencyAccounting
        currencyFormatter.locale = Locale.current
        return currencyFormatter.string(from: NSNumber(integerLiteral: price))
    }
    
    fileprivate func getJoinedString(args: String..., seperator: String) -> String {
        return args.joined(separator: seperator)
    }
    
    fileprivate func getJoinedString(argsA: [String], seperator: String) -> String {
        return argsA.joined(separator: seperator)
    }
    
}
