//
//  CFBaseNetworkService.swift
//  CFTest
//
//  Created by Shashank Kannam on 9/18/19.
//  Copyright © 2019 sk. All rights reserved.
//

import Foundation

open class CFErrorInfo: Error {
    var errorCode: String?
    var urlResponse: URLResponse?
    var errorDescription: String?
}

open class CFRequestSuccessInfo {
    var serializedData: Any?
    var urlResponse: URLResponse?
    var data: Data?
}

enum ServiceResult {
    case success(CFRequestSuccessInfo)
    case failed(CFErrorInfo)
}

typealias RequestResultBlock = (ServiceResult) -> ()


class CFBaseNetworkService {
    
    func getEndpoint() -> String {
        return ""
    }
    
    let session = URLSession.shared
    
    func sendRequest(_ result: @escaping RequestResultBlock) {
        let endpoint = getEndpoint()
        guard let url = URL(string: endpoint), !endpoint.isEmpty else
        {
            let error = CFErrorInfo()
            error.errorDescription = "InvalidURL"
            result(ServiceResult.failed(error))
            return
        }
        session.dataTask(with: url) { (data, urlResponse, error) in
            DispatchQueue.main.async {
                if let data = data {
                    let requestSuccessInfo = CFRequestSuccessInfo()
                    requestSuccessInfo.data = data
                    requestSuccessInfo.urlResponse = urlResponse
                    self.serializeData(result: requestSuccessInfo)
                    result(ServiceResult.success(requestSuccessInfo))
                } else if let error = error {
                    let errorInfo = CFErrorInfo()
                    errorInfo.errorDescription = error.localizedDescription
                    errorInfo.urlResponse = urlResponse
                    result(ServiceResult.failed(errorInfo))
                }
            }
        }.resume()
    }
    
    // Override in subclasses to serialize as per requirements
    func serializeData(result: CFRequestSuccessInfo) {
        result.serializedData = nil
    }
}
