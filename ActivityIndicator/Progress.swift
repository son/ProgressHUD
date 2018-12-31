//
//  Progress.swift
//  ActivityIndicator
//
//  Created by Takeru Sato on 2018/12/31.
//  Copyright © 2018 son. All rights reserved.
//

import UIKit

struct Progress {
    
    private static var container: UIView = UIView()
    private static var loadingView: UIView = UIView()
    private static var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    static func show(on viewController: UIViewController) {
        container.frame = viewController.view.frame
        container.center = viewController.view.center
        container.backgroundColor = UIColorFromHex(rgbValue: 0xffffff, alpha: 0.3)

        loadingView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        loadingView.center = viewController.view.center
        loadingView.backgroundColor = UIColorFromHex(rgbValue: 0x444444, alpha: 0.7)
        loadingView.clipsToBounds = true
        loadingView.layer.cornerRadius = 10

        activityIndicator.frame = CGRect(x: 0.0, y: 0.0, width: 40.0, height: 40.0)
        activityIndicator.style = UIActivityIndicatorView.Style.whiteLarge
        activityIndicator.center = CGPoint(x: loadingView.frame.size.width / 2, y: loadingView.frame.size.height / 2)

        loadingView.addSubview(activityIndicator)
        container.addSubview(loadingView)
        viewController.view.addSubview(container)
        
        viewController.view.isUserInteractionEnabled = false
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        activityIndicator.startAnimating()
    }
    
    static func hide(on viewController: UIViewController) {
        viewController.view.isUserInteractionEnabled = true
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        activityIndicator.stopAnimating()
        container.removeFromSuperview()
    }

    static func UIColorFromHex(rgbValue: UInt32, alpha: Double = 1.0) -> UIColor {
        let red = CGFloat((rgbValue & 0xFF0000) >> 16) / 256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8) / 256.0
        let blue = CGFloat(rgbValue & 0xFF)/256.0
        return UIColor(red: red, green: green, blue: blue, alpha: CGFloat(alpha))
    }
}
