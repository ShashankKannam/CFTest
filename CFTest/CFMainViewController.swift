//
//  ViewController.swift
//  CFTest
//
//  Created by Shashank Kannam on 9/18/19.
//  Copyright © 2019 sk. All rights reserved.
//

import UIKit

class CFMainViewController: UITableViewController {

    var viewModel: CFMainViewConfigurable!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        title = viewModel.title
        registerCells()
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
    }
    
    func registerCells() {
        tableView.register(
            UINib(nibName: CarDetailsTableViewCell.nibName, bundle: nil),
            forCellReuseIdentifier: CarDetailsTableViewCell.reuseID
        )
    }
    
    // MARK: - DataSource
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows(inSection: section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CarDetailsTableViewCell.reuseID) as? CarDetailsTableViewCell else { return UITableViewCell() }
        cell.viewModel = viewModel.cellViewModel(section: indexPath.section, row: indexPath.row)
        return cell
    }

}

