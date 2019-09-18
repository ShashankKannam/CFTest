//
//  CFMainViewPresentable.swift
//  CFTest
//
//  Created by Shashank Kannam on 9/18/19.
//  Copyright © 2019 sk. All rights reserved.
//

import Foundation

protocol CFMainViewPresentable {
    func showCFMainView()
}

extension CFMainViewPresentable where Self: CFMainFlowcontroller {
    func showCFMainView() {
        let viewController = CFMainViewController()
        let viewModel = CFMainViewModel()
        viewModel.flowDelegate = self
        viewController.viewModel = viewModel
        navigationController.pushViewController(viewController, animated: true)
    }
}
