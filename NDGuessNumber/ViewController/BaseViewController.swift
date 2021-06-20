//
//  BaseViewController.swift
//  NDGuessNumber
//
//  Created by DaiDai on 2021/6/21.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("Open: \(type(of: self))")
    }
}
