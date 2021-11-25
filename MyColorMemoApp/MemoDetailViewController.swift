//
//  MemoDetailViewController.swift
//  MyColorMemoApp
//
//  Created by 橋本純一 on 2021/11/24.
//

import UIKit

class MemoDetailViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!
    
    var text: String = ""
    var recordDate: Date = Date()
    
    var dateFormat: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy年MM月dd日"
        return dateFormatter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayData()
    }
    
    func configure(memo: MemoDataModel) {
        text = memo.text
        recordDate = memo.recordDate
        print("データは\(text)と\(recordDate)です!")
    }
    
    func displayData() {
        textView.text = text
        navigationItem.title = dateFormat.string(from: recordDate)
    }
}
