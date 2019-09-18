//
//  CFMainViewModel.swift
//  CFTest
//
//  Created by Shashank Kannam on 9/18/19.
//  Copyright © 2019 sk. All rights reserved.
//

import Foundation



protocol CFMainViewConfigurable: class {
    var title: String { get }
    
    func numberOfSections() -> Int
    func numberOfRows(inSection section: Int) -> Int
    func cellViewModel(section: Int, row: Int) -> CFCommonTableViewCellConfigurable?
}

class CFMainViewModel: CFMainViewConfigurable {
    
    var carsList: [Any] = [1]
    
    var title: String {
        return "CARFAX"
    }
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfRows(inSection section: Int) -> Int {
        return carsList.count
    }
    
    func cellViewModel(section: Int, row: Int) -> CFCommonTableViewCellConfigurable? {
        return nil
    }
    
}
