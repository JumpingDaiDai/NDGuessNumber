//
//  AnswerRecordCell.swift
//  NDGuessNumber
//
//  Created by DaiDai on 2021/6/20.
//

import UIKit

class AnswerRecordCell: UITableViewCell {

    @IBOutlet private var numberLabels: [UILabel]!
    @IBOutlet private weak var aLabel: UILabel!
    @IBOutlet private weak var bLabel: UILabel!
    
    static let cellIdentifier: String = "AnswerRecordCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(answerRecord: AnswerRecord) {
        numberLabels.enumerated().forEach { $0.1.text = answerRecord.numbers[$0.0] }
        aLabel.text = "\(answerRecord.a)"
        bLabel.text = "\(answerRecord.b)"
    }
}
