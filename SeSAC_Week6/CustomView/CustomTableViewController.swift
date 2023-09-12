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

    //viewDidLoad보다 클로저 구문이 먼저 실행이 됨
    //CustomTableViewController 인스턴스 생성 직전에 클로저 구문이 우선 실행
    lazy var tableView = {
        let view = UITableView()
        view.rowHeight = UITableView.automaticDimension //1.
        view.delegate = self // 자기 자신의 인스턴스
        view.dataSource = self
        view.register(CustomTableViewCell.self, forCellReuseIdentifier: "customCell")
        return view
    }()
    
    let imageView = {
        let view = PosterImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        
        return view
    }()
    
//    var isExpand = false // false일때 2줄, true일때 무한대
    
    var sampleList: [Sample] = [Sample(text: "asdfasdfasdasdfasdfasdasdfasdfasdasdfasdfasdasdfasdfasdasdfasdfasdasdfasdfasdasdfasdfasd", isExpand: true), Sample(text: "12312412512512123124125125121231241251251212312412512512123124125125121231241251251212312412512512123124125125121231241251251212312412512512", isExpand: false), Sample(text: "간ㅇㄴ맒느란으ㅏㄴㅁㅎㄴ간ㅇㄴ맒느란으ㅏㄴㅁㅎㄴ간ㅇㄴ맒느란으ㅏㄴㅁㅎㄴ간ㅇㄴ맒느란으ㅏㄴㅁㅎㄴ간ㅇㄴ맒느란으ㅏㄴㅁㅎㄴ간ㅇㄴ맒느란으ㅏㄴㅁㅎㄴ간ㅇㄴ맒느란으ㅏㄴㅁㅎㄴ간ㅇㄴ맒느란으ㅏㄴㅁㅎㄴ", isExpand: true)]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        view.addSubview(tableView)
        view.addSubview(imageView)
        setConstraints()
        
    }

    func setConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        imageView.snp.makeConstraints { make in
            make.size.equalTo(200)
            make.center.equalTo(view)
        }
    }
}

extension CustomTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sampleList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell") as! CustomTableViewCell
        cell.label.text = sampleList[indexPath.row].text
        cell.label.numberOfLines = sampleList[indexPath.row].isExpand ? 0 : 2
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        sampleList[indexPath.row].isExpand.toggle()
//        tableView.reloadData()
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
}
