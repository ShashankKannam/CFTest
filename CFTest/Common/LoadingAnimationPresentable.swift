//
//  LoadingAnimationPresentable.swift
//  CFTest
//
//  Created by Shashank Kannam on 9/18/19.
//  Copyright © 2019 sk. All rights reserved.
//

import UIKit

enum LoadingAnimationState {
    case start
    case stop
    case animating
}

protocol LoadingAnimationPresentable {
    func configureLoadingAnimation(state: LoadingAnimationState)
}

extension LoadingAnimationPresentable where Self: UIViewController {
    
    var indicatorView: UIActivityIndicatorView {
        let indicatorView = self.view.subviews.first { $0 is UIActivityIndicatorView }
        if let indicatorView = indicatorView as? UIActivityIndicatorView {
            return indicatorView
        }
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: self.view.center.x - 50, y: self.view.center.y - 50, width: 100, height: 100))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.gray
        loadingIndicator.startAnimating();
        self.view.addSubview(loadingIndicator)
        return loadingIndicator
    }
    
    func configureLoadingAnimation(state: LoadingAnimationState) {
        switch state {
        case .start:
            view.isUserInteractionEnabled = false
            indicatorView.startAnimating()
        case .stop:
            indicatorView.stopAnimating()
            indicatorView.removeFromSuperview()
            view.isUserInteractionEnabled = true
        default: break
        }
    }
    
}
