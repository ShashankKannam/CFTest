//
//  CarDetailsTableViewCell.swift
//  CFTest
//
//  Created by Shashank Kannam on 9/18/19.
//  Copyright © 2019 sk. All rights reserved.
//

import UIKit
import Kingfisher

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
        if let cellViewModel = viewModel as? CarDetailsTableViewCellConfigurable, let dealerPhoneNumber = cellViewModel.dealerPhoneNumber {
            cellViewModel.call(phoneNumber: dealerPhoneNumber)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupUI(cellViewModel: CarDetailsTableViewCellConfigurable) {
       setupImage(urlString: cellViewModel.carImageURL)
       carModelLabel.font = UIFont.boldSystemFont(ofSize: 16)
       carModelLabel.text = cellViewModel.carModelText
       carDetailsLabel.attributedText = cellViewModel.carDetailsText
       dealerPhoneNumberButton.setTitle(cellViewModel.dealerPhoneNumber, for: .normal)
    }
    
    func setupImage(urlString: String?) {
        guard let urlStringIn = urlString, let url = URL(string: urlStringIn) else {
            carImageView?.image = UIImage(named: "noCarPhoto")
            return
        }
        carImageView?.kf.indicatorType = .activity
        carImageView?.kf.setImage(with: url, placeholder: UIImage(named: "awaitingImage"), options: [.transition(.fade(1))], progressBlock: nil, completionHandler: nil)
    }
    
    static var nibName: String {
        return "CarDetailsTableViewCell"
    }
    
    static var reuseID: String {
        return "CarDetailsTableViewCell"
    }
    
}
