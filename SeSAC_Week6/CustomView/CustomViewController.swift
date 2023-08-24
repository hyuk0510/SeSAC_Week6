//
//  CustomViewController.swift
//  SeSAC_Week6
//
//  Created by 선상혁 on 2023/08/24.
//

import UIKit
import SnapKit

class CustomViewController: UIViewController {

    let idTextField = {
        let view = BlackRadiusTextField()
        view.placeholder = "아이디를 입력해주세요"
        return view
    }()
    
    let passwordTextField = {
        let view = BlackRadiusTextField()
        view.placeholder = "비밀번호를 입력해주세요"
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        view.addSubview(idTextField)
        view.addSubview(passwordTextField)
        setConstraints()
    }

    func setConstraints() {
        idTextField.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(300)
            make.height.equalTo(50)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.leading.equalTo(idTextField.snp.leading)
            make.top.equalTo(idTextField.snp.bottom).offset(20)
            make.width.equalTo(300)
            make.height.equalTo(50)
        }
    }
    
}
