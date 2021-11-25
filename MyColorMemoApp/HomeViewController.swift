//
//  HomeViewController.swift
//  MyColorMemoApp
//
//  Created by 橋本純一 on 2021/11/23.
//

import Foundation
import UIKit

class HomeViewControllere: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var memoDataList: [MemoDataModel] = []
    
    override func viewDidLoad() {
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        setMemoData()
    }
    
    func setMemoData() {
        for i in 1...5 {
            let memoDataModel = MemoDataModel(text: "このメモは\(i)番目のメモです。", recordDate: Date())
            memoDataList.append(memoDataModel)
        }
    }
}

extension HomeViewControllere: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memoDataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        let memoDataModel: MemoDataModel = memoDataList[indexPath.row]
        cell.textLabel?.text = memoDataModel.text
        cell.detailTextLabel?.text = "\(memoDataModel.recordDate)"
        return cell
    }
}

extension HomeViewControllere: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboad = UIStoryboard(name: "Main", bundle: nil)
        let memoDatailViewController = storyboad.instantiateViewController(identifier: "MemoDetailViewController") as!
        MemoDetailViewController
        let memoData = memoDataList[indexPath.row]
        memoDatailViewController.configure(memo: memoData)
        tableView.deselectRow(at: indexPath, animated: true)
        navigationController?.pushViewController(memoDatailViewController, animated: true)
    }
}
