//
//  CFMainFlowDelegate.swift
//  CFTest
//
//  Created by Shashank Kannam on 9/18/19.
//  Copyright © 2019 sk. All rights reserved.
//

import UIKit

protocol CFMainFlowDelegate: class, CFMainViewPresentable { }

class CFMainFlowcontroller: CFMainFlowDelegate {
    var navigationController: UINavigationController
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}
