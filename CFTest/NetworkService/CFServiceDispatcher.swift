//
//  CFServiceDispatcher.swift
//  CFTest
//
//  Created by Shashank Kannam on 9/18/19.
//  Copyright © 2019 sk. All rights reserved.
//

import Foundation

class CFServiceDispatcher {
    
    static let shared = CFServiceDispatcher()
    
    func getCarsList(_ result: @escaping RequestResultBlock) {
        let service = GetCarsListService()
        service.sendRequest(result)
    }
}
