//
//  GameManager.swift
//  NDGuessNumber
//
//  Created by DaiDai on 2021/6/19.
//

import Foundation

class GameManager {
    
    static let sharedInstance = GameManager()
    
    /// 問題數字陣列
    var questionNumbers: [String] = [String](repeating: "0", count: 4)
    
    /// 建立一個新的題目
    func makeNewQuestionNumbers() {
        questionNumbers = getRandomNumbers(maxNumber: 10, listSize: 4)
        print("====================")
        print("Q: \(questionNumbers)")
        print("====================")
    }
    
    /// 輸入答案陣列，取得比對結果，位置相同為Ａ，包含但位置不同為Ｂ
    /// - Parameters:
    ///   - answer: 答案數字陣列
    /// - Returns: 比對結果
    func getResult(answer: [String]) -> (a: Int, b: Int) {
        
        print("A: \(answer)")
        
        let a = checkA(question: questionNumbers, answer: answer)
        let b = checkB(question: questionNumbers, answer: answer)
        
        return (a, b)
    }
    
    // MARK: - Private
    
    private init() {
        print("GameManager init")
    }
    
    /// 檢查A，包含該數字，但且位置相同
    /// - Parameters:
    ///   - question: 問題數字陣列
    ///   - answer: 答案數字陣列
    /// - Returns: 幾個數字包含，位置也相同
    private func checkA(question: [String], answer: [String]) -> Int {
        
        // 計數器
        var sameCount = 0
        
        // question 和 answer 同一個 index，的數字相同，就把計數器 +1
        for index in 0..<question.count {
            if question[index] == answer[index] {
                sameCount += 1
            }
        }
        
        return sameCount
    }
    
    /// 檢查B，包含該數字，但位置不同
    /// - Parameters:
    ///   - question: 問題數字陣列
    ///   - answer: 答案數字陣列
    /// - Returns: 幾個數字包含，但位置不同
    private func checkB(question: [String], answer: [String]) -> Int {
        
        // 計數器
        var sameCount = 0
        
        // loop answer 中的數字，若 question 中包含該數字，就把計數器 +1
        answer.forEach {
            if question.contains($0){
                sameCount += 1
            }
        }
        
        // 由於檢查出來的 sameCount 數量會包含 "檢查A" 數量，所以必須將 "檢查A" 的數量 從 sameCount 中扣除
        sameCount -= checkA(question: question, answer: answer)
        
        return sameCount
    }
    
    /// 產生隨機亂數陣列
    /// - Parameters:
    ///   - maxNumber: 亂數最大值
    ///   - listSize: 數字數量
    /// - Returns: 亂數陣列
    private func getRandomNumbers(maxNumber: Int, listSize: Int)-> [String] {
        
        var randomNumbers = [String]()

        while randomNumbers.count < listSize {
            let randomNumber: String = "\(Int(arc4random_uniform(UInt32(maxNumber + 1))))"
            
            // 不重複才加進 randomNumbers
            if !randomNumbers.contains(randomNumber) {
                randomNumbers.append(randomNumber)
            }
        }

        return randomNumbers
    }
}

