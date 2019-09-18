//
//  CarDetailsTableViewCell.swift
//  CFTest
//
//  Created by Shashank Kannam on 9/18/19.
//  Copyright © 2019 sk. All rights reserved.
//

import UIKit

class CarDetailsTableViewCell: UITableViewCell {
    
    var viewModel: CFCommonTableViewCellConfigurable? {
        didSet {
            if let cellViewModel = viewModel as? CarDetailsTableViewCellConfigurable {
                setupUI(cellViewModel: cellViewModel)
            }
        }
    }
    
    @IBOutlet weak var carImageView: UIImageView!
    @IBOutlet weak var carModelLabel: UILabel!
    @IBOutlet weak var carDetailsLabel: UILabel!
    @IBOutlet weak var dealerPhoneNumberButton: UIButton!
    
    @IBAction func numberTapped(_ sender: UIButton) {
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupUI(cellViewModel: CarDetailsTableViewCellConfigurable) {
       carModelLabel.font = UIFont.boldSystemFont(ofSize: 16)
       carModelLabel.text = cellViewModel.carModelText
       carDetailsLabel.attributedText = cellViewModel.carDetailsText
       dealerPhoneNumberButton.setTitle(cellViewModel.dealerPhoneNumber, for: .normal)
    }
    
    static var nibName: String {
        return "CarDetailsTableViewCell"
    }
    
    static var reuseID: String {
        return "CarDetailsTableViewCell"
    }
    
}
