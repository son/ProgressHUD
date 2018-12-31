//
//  ViewController.swift
//  ActivityIndicator
//
//  Created by Takeru Sato on 2018/12/31.
//  Copyright © 2018 son. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func showButtonTapped(_ sender: UIButton) {
        Progress.show(on: self)
        Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(hide), userInfo: nil, repeats: false)
    }
    
    @objc private func hide() {
        Progress.hide(on: self)
    }
}
