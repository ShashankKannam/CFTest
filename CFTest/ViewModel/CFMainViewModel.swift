//
//  CFMainViewModel.swift
//  CFTest
//
//  Created by Shashank Kannam on 9/18/19.
//  Copyright © 2019 sk. All rights reserved.
//

import Foundation

protocol CFMainViewDelegate: class, AlertPresentable, LoadingAnimationPresentable {
    func reloadData()
}

protocol CFMainViewConfigurable: class {
    var delegate: CFMainViewDelegate? { get set }
    var flowDelegate: CFMainFlowDelegate? { set get }
    
    var title: String { get }
    
    func configureDataSource()
    func numberOfSections() -> Int
    func numberOfRows(inSection section: Int) -> Int
    func cellViewModel(section: Int, row: Int) -> CFCommonTableViewCellConfigurable?
}

class CFMainViewModel: CFMainViewConfigurable {
    
    var delegate: CFMainViewDelegate?
    var flowDelegate: CFMainFlowDelegate?
    
    var carListings: [Listings] = []
    
    var title: String {
        // TODO: Localization
        return "CARFAX"
    }
    
    func configureDataSource() {
        delegate?.configureLoadingAnimation(state: .start)
        carListings.removeAll()
        CFServiceDispatcher.shared.getCarsList {
            switch $0 {
            case .success(let resultInfo):
                self.carListings = (resultInfo.serializedData as? CarDetails)?.listings ?? []
            case .failed(let errorInfo):
                self.delegate?.showBasicAlert(message: errorInfo.localizedDescription, title: "Service Unavailable")
            }
            self.delegate?.reloadData()
            self.delegate?.configureLoadingAnimation(state: .stop)
        }
    }
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfRows(inSection section: Int) -> Int {
        return carListings.count
    }
    
    func cellViewModel(section: Int, row: Int) -> CFCommonTableViewCellConfigurable? {
        guard let listing = carListings[safe: row] else { return nil }
        return CarDetailsTableViewCellViewModel(carListing: listing)
    }
    
}
