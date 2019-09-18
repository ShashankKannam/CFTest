//
//  CarDetailsTableViewCell.swift
//  CFTest
//
//  Created by Shashank Kannam on 9/18/19.
//  Copyright © 2019 sk. All rights reserved.
//

import UIKit

protocol CarDetailsTableViewCellConfigurable: CFCommonTableViewCellConfigurable {
    
}

protocol CFCommonTableViewCellConfigurable {
//    var nibName: String { get }
//    var reuseID: String { get }
}

class CarDetailsTableViewCellViewModel: CarDetailsTableViewCellConfigurable {
    
//    var nibName: String {
//        return "CarDetailsTableViewCell"
//    }
//
//    var reuseID: String {
//        return "CarDetailsTableViewCell"
//    }
}

class CarDetailsTableViewCell: UITableViewCell {
    
    var viewModel: CFCommonTableViewCellConfigurable? {
        didSet {
            if let cellViewModel = viewModel as? CarDetailsTableViewCellConfigurable {
                setupUI(cellViewModel: cellViewModel)
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupUI(cellViewModel: CarDetailsTableViewCellConfigurable) {
        
    }
    
    static var nibName: String {
        return "CarDetailsTableViewCell"
    }
    
    static var reuseID: String {
        return "CarDetailsTableViewCell"
    }
    
}
