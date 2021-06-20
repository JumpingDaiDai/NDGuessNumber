//
//  MainMenuViewController.swift
//  NDGuessNumber
//
//  Created by DaiDai on 2021/6/20.
//

import UIKit

class MainMenuViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func newGameButtonIsClick(_ sender: UIButton) {
        print("新遊戲")
        
        self.navigationController?.goGameViewController()
    }
    
    
    @IBAction func recordButtonIsClick(_ sender: UIButton) {
        print("紀錄")
    }
}
