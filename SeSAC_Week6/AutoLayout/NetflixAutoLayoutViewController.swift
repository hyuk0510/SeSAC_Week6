//
//  NetflixAutoLayoutViewController.swift
//  SeSAC_Week6
//
//  Created by 선상혁 on 2023/08/24.
//

import UIKit

class NetflixAutoLayoutViewController: UIViewController {

    let titleLabel = {
        let label = UILabel()
        label.text = "SUNFLIX"
        label.font = .systemFont(ofSize: 35, weight: .heavy)
        label.textColor = .red
        return label
    }()
    
    let emailTextField = {
        let textField = CornerRadiusTextField()
        textField.attributedPlaceholder = NSAttributedString(string: "이메일 주소 또는 전화번호", attributes: [.foregroundColor: UIColor.white])
        
        return textField
    }()
    
    let passwordTextField = {
        let textField = CornerRadiusTextField()
        textField.isSecureTextEntry = true
        textField.attributedPlaceholder = NSAttributedString(string: "비밀번호", attributes: [.foregroundColor: UIColor.white])
        return textField
    }()
    
    let nicknameTextField = {
        let textField = CornerRadiusTextField()
        textField.attributedPlaceholder = NSAttributedString(string: "닉네임", attributes: [.foregroundColor: UIColor.white])
        return textField
    }()
    
    let locationTextField = {
        let textField = CornerRadiusTextField()
        textField.attributedPlaceholder = NSAttributedString(string: "위치", attributes: [.foregroundColor: UIColor.white])
        return textField
    }()
    
    let recommendCodeTextField = {
        let textField = CornerRadiusTextField()
        textField.attributedPlaceholder = NSAttributedString(string: "추천 코드 입력", attributes: [.foregroundColor: UIColor.white])
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
    
    var viewModel = NetflixModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(UserDefaults.standard.string(forKey: "email") ?? "")
        
        signUpButton.addTarget(self, action: #selector(signUpButtonPressed), for: .touchUpInside)
        emailTextField.addTarget(self, action: #selector(emailTextFieldPressed), for: .editingChanged)
        nicknameTextField.addTarget(self, action: #selector(nicknameTextFieldPressed), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(passwordTextFieldPressed), for: .editingChanged)
        locationTextField.addTarget(self, action: #selector(locationTextFieldPressed), for: .editingChanged)
        recommendCodeTextField.addTarget(self, action: #selector(recommendCodeTextFieldPressed), for: .editingChanged)

        viewModel.list.bind { data in
            self.emailTextField.text = data.email
            self.nicknameTextField.text = data.nickName
            self.passwordTextField.text = data.pw
            self.locationTextField.text = data.location
            self.recommendCodeTextField.text = data.code
        }
        
        viewModel.isValid.bind { bool in
            self.signUpButton.isEnabled = bool
            self.signUpButton.backgroundColor = bool ? .green : .red
        }
        
        configure()
        setConstraints()
    }
    
    @objc func signUpButtonPressed() {
        viewModel.signIn {
            let alert = UIAlertController(title: "로그인 되었습니다.", message: nil, preferredStyle: .alert)
            let cancel = UIAlertAction(title: "확인", style: .default)
            
            alert.addAction(cancel)
            
            present(alert, animated: true)
        }
    }
    
    @objc func emailTextFieldPressed() {
        viewModel.isValidInput()
        viewModel.list.value.email = emailTextField.text!
    }
    
    @objc func nicknameTextFieldPressed() {
        viewModel.isValidInput()
        viewModel.list.value.nickName = nicknameTextField.text!
    }
    
    @objc func passwordTextFieldPressed() {
        viewModel.isValidInput()
        viewModel.list.value.pw = passwordTextField.text!
    }
    
    @objc func locationTextFieldPressed() {
        viewModel.isValidInput()
        viewModel.list.value.location = locationTextField.text!
    }
    
    @objc func recommendCodeTextFieldPressed() {
        viewModel.isValidInput()
        viewModel.list.value.code = recommendCodeTextField.text!
    }
    
    func configure() {
        let subViewList = [titleLabel, emailTextField, passwordTextField, nicknameTextField, locationTextField, recommendCodeTextField, signUpButton, extraInfoLabel, switchch]
        
        for subview in subViewList {
            view.addSubview(subview)
        }
                
        view.backgroundColor = .black
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
    
}
