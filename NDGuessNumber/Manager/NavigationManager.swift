//
//  NavigationManager.swift
//  NDGuessNumber
//
//  Created by DaiDai on 2021/6/20.
//

import UIKit

extension UINavigationController {
    
    func goGameViewController() {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(identifier: "GameViewController")
        self.pushViewController(vc, animated: true)
    }
} 
