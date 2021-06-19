//
//  GameViewController.swift
//  NDGuessNumber
//
//  Created by DaiDai on 2021/6/17.
//

import UIKit

class GameViewController: UIViewController {

    var gameManager = GameManager.sharedInstance
    
    var answer: [Int] = [7, 1, 4, 8]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        gameManager.makeNewQuestionNumbers()
    }
    
    @IBAction func newQuestionButtonIsClick(_ sender: UIButton) {
        gameManager.makeNewQuestionNumbers()
    }
    
    @IBAction func enterButtonIsClick(_ sender: UIButton) {
        print(gameManager.getResult(answer: answer))
    }
    
    @IBAction func set3071() {
        answer = [3, 0, 7, 1]
    }
    
    @IBAction func set6918() {
        answer = [6, 9, 1, 8]
    }
    
    @IBAction func set8210() {
        answer = [8, 2, 1, 0]
    }
    
    @IBAction func exitButtonIsClick(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}

