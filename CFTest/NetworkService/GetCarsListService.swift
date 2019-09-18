//
//  GetCarsListService.swift
//  CFTest
//
//  Created by Shashank Kannam on 9/18/19.
//  Copyright © 2019 sk. All rights reserved.
//

import Foundation

class GetCarsListService: CFBaseNetworkService {
    
    override func getEndpoint() -> String {
        return "https://carfax-for-consumers.firebaseio.com/assignment.json"
    }
    
    override func serializeData(result: CFRequestSuccessInfo) {
        if let data = result.data, let carsDetails = try? JSONDecoder().decode(CarDetails.self, from: data) {
            result.serializedData = carsDetails
        }
    }
}
