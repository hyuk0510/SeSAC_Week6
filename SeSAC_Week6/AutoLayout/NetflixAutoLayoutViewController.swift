//
//  NetflixAutoLayoutViewController.swift
//  SeSAC_Week6
//
//  Created by 선상혁 on 2023/08/24.
//

import UIKit
import SnapKit

class NetflixAutoLayoutViewController: UIViewController {

    let titleLabel = {
        let label = UILabel()
        label.text = "SUNFLIX"
        label.font = .systemFont(ofSize: 35, weight: .heavy)
        label.textColor = .red
        return label
    }()
    
    lazy var emailTextField = {
        let textField = UITextField()
        designTextField(textField, "이메일 주소 또는 전화번호")
        return textField
    }()
    
    lazy var passwordTextField = {
        let textField = UITextField()
        designTextField(textField, "비밀번호")
        return textField
    }()
    
    lazy var nicknameTextField = {
        let textField = UITextField()
        designTextField(textField, "닉네임")
        return textField
    }()
    
    lazy var locationTextField = {
        let textField = UITextField()
        designTextField(textField, "위치")
        return textField
    }()
    
    lazy var recommendCodeTextField = {
        let textField = UITextField()
        designTextField(textField, "추천 코드 입력")
        return textField
    }()
    
    let signUpButton = {
        let button = UIButton()
        var config = UIButton.Configuration.filled()
        var titleAttr = AttributedString.init("회원가입")
        titleAttr.font = .systemFont(ofSize: 20, weight: .heavy)
        config.attributedTitle = titleAttr
        config.baseForegroundColor = .black
        config.baseBackgroundColor = .white
        config.titleAlignment = .center
        button.configuration = config
        button.layer.cornerRadius = 10
        return button
    }()
    
    let extraInfoLabel = {
        let label = UILabel()
        label.text = "추가 정보 입력"
        label.font = .systemFont(ofSize: 20)
        label.textColor = .white
        return label
    }()
    
    let switchch = {
        let switchch = UISwitch()
        switchch.onTintColor = .red
        switchch.isOn = true
        return switchch
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let subViewList = [titleLabel, emailTextField, passwordTextField, nicknameTextField, locationTextField, recommendCodeTextField, signUpButton, extraInfoLabel, switchch]
        
        for subview in subViewList {
            view.addSubview(subview)
        }
                
        view.backgroundColor = .black
        setConstraints()
    }
    
    func setConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide)
        }
        emailTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.horizontalEdges.equalToSuperview().inset(40)
            make.top.equalTo(titleLabel.snp.bottom).offset(150)
            make.height.equalTo(40)
        }
        passwordTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.horizontalEdges.equalTo(emailTextField)
            make.top.equalTo(emailTextField.snp.bottom).offset(15)
            make.height.equalTo(40)
        }
        nicknameTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.horizontalEdges.equalTo(emailTextField)
            make.top.equalTo(passwordTextField.snp.bottom).offset(15)
            make.height.equalTo(40)
        }
        locationTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.horizontalEdges.equalTo(emailTextField)
            make.top.equalTo(nicknameTextField.snp.bottom).offset(15)
            make.height.equalTo(40)
        }
        recommendCodeTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.horizontalEdges.equalTo(emailTextField)
            make.top.equalTo(locationTextField.snp.bottom).offset(15)
            make.height.equalTo(40)
        }
        signUpButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.horizontalEdges.equalTo(emailTextField)
            make.top.equalTo(recommendCodeTextField.snp.bottom).offset(15)
            make.height.equalTo(50)
        }
        extraInfoLabel.snp.makeConstraints { make in
            make.leading.equalTo(emailTextField.snp.leading)
            make.top.equalTo(signUpButton.snp.bottom).offset(20)
        }
        switchch.snp.makeConstraints { make in
            make.trailing.equalTo(emailTextField.snp.trailing)
            make.centerY.equalTo(extraInfoLabel)
        }
    }
    
    func designTextField(_ tf: UITextField, _ placeholder: String) {
        tf.layer.cornerRadius = 5
        tf.backgroundColor = .gray
        tf.textAlignment = .center
        tf.attributedPlaceholder = NSAttributedString(string: placeholder,attributes: [.foregroundColor: UIColor.white])
    }

}
