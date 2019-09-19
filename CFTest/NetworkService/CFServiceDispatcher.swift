//
//  CFServiceDispatcher.swift
//  CFTest
//
//  Created by Shashank Kannam on 9/18/19.
//  Copyright © 2019 sk. All rights reserved.
//

import Foundation

/// Used to use actual service for mock serive, in this assignment haven't added mock services
class CFServiceDispatcher {
    
    static let shared = CFServiceDispatcher()
    
    func getCarsList(_ result: @escaping RequestResultBlock) {
        let service = GetCarsListService()
        service.sendRequest(result)
    }
}
