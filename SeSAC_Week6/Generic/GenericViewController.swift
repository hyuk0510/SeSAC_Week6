//
//  GenericViewController.swift
//  SeSAC_Week6
//
//  Created by 선상혁 on 2023/08/24.
//

import UIKit
import SnapKit

class GenericViewController: UIViewController {

    let sampleLabel = UILabel()
    let sampleButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Hi"
        
        view.backgroundColor = .gray
        
        view.addSubview(sampleLabel)
        sampleLabel.backgroundColor = .yellow
        configureBorder(view: sampleLabel)
        sampleLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(100)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.height.equalTo(50)
        }

        view.addSubview(sampleButton)
        sampleButton.backgroundColor = .green
        configureBorder(view: sampleButton)
        sampleButton.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(100)
            make.top.equalTo(sampleLabel.snp.bottom).offset(20)
            make.height.equalTo(50)
        }
        
        configureBorder(view: sampleButton)
        
        let generic = sum(a: 3.241, b: 4.211)
        let generic2 = sum(a: 3, b: 4)
        
        let value = sumInt(a: 3, b: 7)
        print(value)
        
        let value2 = sumDouble(a: 3.5, b: 7.7)
        print(value2)
    }

    
}
