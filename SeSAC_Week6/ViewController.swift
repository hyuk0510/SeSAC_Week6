//
//  ViewController.swift
//  SeSAC_Week6
//
//  Created by 선상혁 on 2023/08/21.
//

import UIKit
import SnapKit

//1. 객체 얹이고, 레이아웃 잡고, 아웃렛 연결, 속성 조절

//1. 뷰객체 프로퍼티 선언(클래스 인스턴스 생성)
//2. 명시적으로 루트뷰에 추가 (+ translatesAutoresizingMaskIntoConstraints)
//3. 크기와 위치 정의
//4. 속성 정의
//=> Frame 한계
//=> AutoResizingMask, AutoLayout => 스토리보드 대응
//=> NSLayoutConstraints => 코드베이스 대응
    //1. isActive
    //2. addConstraints
//=> NSLayoutAnchor

class ViewController: UIViewController {

    let emailTextField = UITextField()
    let passwordTextField = UITextField()
    let signButton = UIButton()
    let theaterButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(theaterButton)
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        
        emailTextField.frame = CGRect(x: 50, y: 80, width: UIScreen.main.bounds.width - 100, height: 50)
        
        emailTextField.backgroundColor = .lightGray
        emailTextField.isSecureTextEntry = true
        emailTextField.keyboardType = .numberPad
        emailTextField.placeholder = "닉네임을 입력해주세요"
        
//        NSLayoutConstraint(item: passwordTextField, attribute: .leading, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .leading, multiplier: 1, constant: 50).isActive = true //레이아웃 활성화
//
//        NSLayoutConstraint(item: passwordTextField, attribute: .trailing, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .trailing, multiplier: 1, constant: -50).isActive = true
//
//        NSLayoutConstraint(item: passwordTextField, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 60).isActive = true
//
//        NSLayoutConstraint(item: passwordTextField, attribute: .top, relatedBy: .equal, toItem: emailTextField, attribute: .bottom, multiplier: 1, constant: 50).isActive = true
        
        //addConstraints
        
        let leading = NSLayoutConstraint(item: passwordTextField, attribute: .leading, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .leading, multiplier: 1, constant: 50)
        
        let trailing = NSLayoutConstraint(item: passwordTextField, attribute: .trailing, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .trailing, multiplier: 1, constant: -50)
        
        let height = NSLayoutConstraint(item: passwordTextField, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 60)
        
        let top = NSLayoutConstraint(item: passwordTextField, attribute: .top, relatedBy: .equal, toItem: emailTextField, attribute: .bottom, multiplier: 1, constant: 50)
        
        view.addConstraints([leading, trailing, height, top])
        
        passwordTextField.backgroundColor = .darkGray
        
        setLayoutAnchor()
        setTheaterButton()
    }

    func setLayoutAnchor() {
        view.addSubview(signButton)
        
        signButton.backgroundColor = .green
        signButton.setTitle("실습", for: .normal)
        signButton.tintColor = .white
        signButton.addTarget(self, action: #selector(signButtonPressed), for: .touchUpInside)
        
        signButton.snp.makeConstraints { make in
            make.leading.equalTo(emailTextField.snp.leading)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            make.width.equalTo(150)
        }
    }
    
    @objc func signButtonPressed() {
       
        transition(storyboard: "Main", style: .presentFullNavigation, viewController: GenericViewController.self)
    }
    
    func setTheaterButton() {
        theaterButton.backgroundColor = .purple
        theaterButton.setTitle("영화관", for: .normal)
        theaterButton.tintColor = .white
        theaterButton.addTarget(self, action: #selector(theaterButtonPressed), for: .touchUpInside)
        
        theaterButton.snp.makeConstraints { make in
            make.leading.equalTo(signButton.snp.trailing).offset(20)
            make.trailing.equalTo(emailTextField.snp.trailing)
            make.bottom.equalTo(signButton.snp.bottom)
        }
    }
    
    @objc func theaterButtonPressed() {
        let vc = TheaterLocationViewController()
        vc.modalPresentationStyle = .fullScreen
        
        present(vc, animated: true)
    }

}

