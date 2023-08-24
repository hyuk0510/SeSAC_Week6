//
//  CustomTableViewController.swift
//  SeSAC_Week6
//
//  Created by 선상혁 on 2023/08/24.
//

import UIKit
import SnapKit

struct Sample {
    let text: String
    var isExpand: Bool
}

class CustomTableViewController: UIViewController {

    let tableView = {
        let view = UITableView()
        view.rowHeight = UITableView.automaticDimension //1.
        return view
    }()
    
//    var isExpand = false // false일때 2줄,true일때 무한대
    
    var sampleList: [Sample] = [Sample(text: "asdfasdfasdasdfasdfasdasdfasdfasdasdfasdfasdasdfasdfasdasdfasdfasdasdfasdfasdasdfasdfasd", isExpand: true), Sample(text: "12312412512512123124125125121231241251251212312412512512123124125125121231241251251212312412512512123124125125121231241251251212312412512512", isExpand: false), Sample(text: "간ㅇㄴ맒느란으ㅏㄴㅁㅎㄴ간ㅇㄴ맒느란으ㅏㄴㅁㅎㄴ간ㅇㄴ맒느란으ㅏㄴㅁㅎㄴ간ㅇㄴ맒느란으ㅏㄴㅁㅎㄴ간ㅇㄴ맒느란으ㅏㄴㅁㅎㄴ간ㅇㄴ맒느란으ㅏㄴㅁㅎㄴ간ㅇㄴ맒느란으ㅏㄴㅁㅎㄴ간ㅇㄴ맒느란으ㅏㄴㅁㅎㄴ", isExpand: true)]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        view.addSubview(tableView)
        setConstraints()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "customCell")
    }

    func setConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension CustomTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sampleList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell")!
        cell.textLabel?.text = sampleList[indexPath.row].text
        cell.textLabel?.numberOfLines = sampleList[indexPath.row].isExpand ? 0 : 2
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        sampleList[indexPath.row].isExpand.toggle()
//        tableView.reloadData()
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
}
