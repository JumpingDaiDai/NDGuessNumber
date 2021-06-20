//
//  GameViewController.swift
//  NDGuessNumber
//
//  Created by DaiDai on 2021/6/17.
//

import UIKit

class GameViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var answerNumberLabels: [UILabel]!
    @IBOutlet weak var settingFullScreenView: UIView!
    @IBOutlet weak var settingView: UIView!
    
    var gameManager = GameManager.sharedInstance
    var answer: [String] = ["", "", "", ""]
    
    // 回答紀錄
    var answerRecords: [AnswerRecord] = [AnswerRecord]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 註冊 cell
        cellRegister()
        
        // 設定頁面初始化
        settingInit()
        
        // 遊戲畫面初始化
        gameInit()
        
        // 隨機出題
        gameManager.makeNewQuestionNumbers()
    }
    
    // MARK: - Private Methods
    
    /// 設定頁面初始化
    private func settingInit() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideSettingView))
        settingFullScreenView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    /// 設定輸入的數字
    private func answerNumbersUpdate() {
        answerNumberLabels.enumerated().forEach { $0.1.text = "\(answer[$0.0])" }
    }
    
    /// 顯示設定頁面
    private func showSettingView() {
        settingFullScreenView.isHidden = false
        
    }
    
    /// 顯示隱藏設定頁面
    @objc private func hideSettingView() {
        
        
        settingFullScreenView.isHidden = true
    }
    
    // 遊戲畫面初始化
    private func gameInit() {
        answer = ["", "", "", ""]
        answerRecords = [AnswerRecord]()
        answerNumbersUpdate()
        tableView.reloadData()
    }
    
    // MARK: - Button Action
    @IBAction func settingButtonIsClick() {
        showSettingView()
    }
    
    @IBAction func enterButtonIsClick(_ sender: UIButton) {
        
        // 比對結果
        let result = gameManager.getResult(answer: answer)
        
        // 將結果加入進回答紀錄
        let answerRecord = AnswerRecord(numbers: answer, a: result.a, b: result.b)
        answerRecords.append(answerRecord)
        tableView.reloadData()
        
        // 清空輸入的數字
        answer = ["", "", "", ""]
        answerNumbersUpdate()
        
        print("\(result.a) A \(result.b) B")
    }
    
    @IBAction func newQuestionButtonIsClick(_ sender: UIButton) {
        gameManager.makeNewQuestionNumbers()
        gameInit()
    }
    
    @IBAction func set3071() {
        answer = ["3", "0", "7", "1"]
        answerNumbersUpdate()
    }
    
    @IBAction func set6918() {
        answer = ["6", "9", "1", "8"]
        answerNumbersUpdate()
    }
    
    @IBAction func set8210() {
        answer = ["8", "2", "1", "0"]
        answerNumbersUpdate()
    }
    
    @IBAction func exitButtonIsClick(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}

// MARK: - UITableViewDelegate & UITableViewDataSource
extension GameViewController: UITableViewDelegate, UITableViewDataSource {
    
    private func cellRegister() {
        tableView.register(UINib(nibName: AnswerRecordCell.cellIdentifier, bundle: nil), forCellReuseIdentifier: AnswerRecordCell.cellIdentifier)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return answerRecords.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AnswerRecordCell.cellIdentifier, for: indexPath) as? AnswerRecordCell else { return UITableViewCell() }
        
        let answerRecord = answerRecords[indexPath.row]
        cell.configure(answerRecord: answerRecord)
        
        return cell
    }
}

