//
//  AutoLayoutEx1ViewController.swift
//  SeSAC_Week6
//
//  Created by 선상혁 on 2023/08/22.
//

import UIKit
import SnapKit

class AutoLayoutEx1ViewController: UIViewController {
    
    let topView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    
    let titleTextField = {
        let tf = UITextField()
        tf.layer.borderColor = UIColor.black.cgColor
        tf.layer.borderWidth = 1
        tf.placeholder = "제목을 입력해주세요"
        tf.textAlignment = .center
        return tf
    }()
    
    let dateTextField = {
        let tf = UITextField()
        tf.layer.borderColor = UIColor.black.cgColor
        tf.layer.borderWidth = 1
        tf.placeholder = "날짜를 입력해주세요"
        tf.textAlignment = .center
        return tf
    }()
    
    let bottomView = {
        let view = UIView()
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(topView)
        view.addSubview(titleTextField)
        view.addSubview(dateTextField)
        view.addSubview(bottomView)
        
        setViewConstraint()
    }
    
    func setViewConstraint() {
        topView.snp.makeConstraints { make in
            make.topMargin.equalToSuperview()
            make.horizontalEdges.equalTo(view).inset(20)
            make.centerX.equalToSuperview()
            make.height.equalTo(view).multipliedBy(0.3)
        }
        
        titleTextField.snp.makeConstraints { make in
            make.topMargin.equalTo(topView.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(topView.snp.width)
            make.height.equalTo(50)
        }
        
        dateTextField.snp.makeConstraints { make in
            make.topMargin.equalTo(titleTextField.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(topView.snp.width)
            make.height.equalTo(titleTextField.snp.height)
        }
        
        bottomView.snp.makeConstraints { make in
            make.topMargin.equalTo(dateTextField.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(topView.snp.width)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
        
    }
   
}
