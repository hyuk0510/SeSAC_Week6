//
//  AutoLayoutEx2ViewController.swift
//  SeSAC_Week6
//
//  Created by 선상혁 on 2023/08/22.
//

import UIKit
import SnapKit

class AutoLayoutEx2ViewController: UIViewController {
        
    let buttonSize = 30
    
    let backGroundImageView = {
        var imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView = UIImageView(image: UIImage(named: "극한직업"))
        
        return imageView
    }()
    
    let backView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.5087780356, green: 0.5087780356, blue: 0.5087780356, alpha: 0.5775300083)
        
        return view
    }()
    
    let backButton = {
        let button = UIButton()
        button.tintColor = .white
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        
        return button
    }()
    
    let settingButton = {
        let button = UIButton()
        button.tintColor = .white
        button.setImage(UIImage(systemName: "gearshape"), for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        
        return button
    }()
    
    let diceButton = {
        let button = UIButton()
        button.tintColor = .white
        button.setImage(UIImage(systemName: "dice"), for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        
        return button
    }()
    
    let giftButton = {
        let button = UIButton()
        button.tintColor = .white
        button.setImage(UIImage(systemName: "gift"), for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        
        return button
    }()
    
    let profileImageView = {
        var imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView = UIImageView(image: UIImage(named: "launch"))
        
        return imageView
    }()
    
    let userLabel = {
        let label = UILabel()
        label.text = "선상혁"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 17)
        
        return label
    }()
    
    let myChatButton = {
        let button = UIButton()
        button.tintColor = .white
        button.setImage(UIImage(systemName: "message.fill"), for: .normal)
        
        return button
    }()
    
    let myChatLabel = {
        let label = UILabel()
        label.text = "나와의 채팅"
        label.textColor = .white
        label.font = .systemFont(ofSize: 15)
        
        return label
    }()
    
    let setProfileButton = {
        let button = UIButton()
        button.tintColor = .white
        button.setImage(UIImage(systemName: "pencil"), for: .normal)
        
        return button
    }()
    
    let setProfileLabel = {
        let label = UILabel()
        label.text = "프로필 편집"
        label.textColor = .white
        label.font = .systemFont(ofSize: 15)
        
        return label
    }()
    
    let storyButton = {
        let button = UIButton()
        button.tintColor = .white
        button.setImage(UIImage(systemName: "book.fill"), for: .normal)
        
        return button
    }()
    
    let storyLabel = {
        let label = UILabel()
        label.text = "카카오스토리"
        label.textColor = .white
        label.font = .systemFont(ofSize: 15)
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let list = [backGroundImageView, backView, backButton, settingButton, diceButton, giftButton, profileImageView, userLabel, myChatButton, myChatLabel, setProfileButton, setProfileLabel, storyButton, storyLabel]
        
        for item in list {
            view.addSubview(item)
        }
        
        setViewConstraint()
    }
    
    func setViewConstraint() {
        backGroundImageView.snp.makeConstraints { make in
            make.size.equalToSuperview()
        }
        backView.snp.makeConstraints { make in
            make.size.equalTo(backGroundImageView)
        }
        backButton.snp.makeConstraints { make in
            make.top.leading.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        settingButton.snp.makeConstraints { make in
            make.top.equalTo(backButton.snp.top)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.size.equalTo(buttonSize)
            settingButton.layer.cornerRadius = CGFloat(buttonSize / 2)
        }
        diceButton.snp.makeConstraints { make in
            make.top.equalTo(backButton.snp.top)
            make.trailing.equalTo(settingButton.snp.leading).offset(-15)
            make.size.equalTo(buttonSize)
            diceButton.layer.cornerRadius = CGFloat(buttonSize / 2)
        }
        giftButton.snp.makeConstraints { make in
            make.top.equalTo(backButton.snp.top)
            make.trailing.equalTo(diceButton.snp.leading).offset(-15)
            make.size.equalTo(buttonSize)
            giftButton.layer.cornerRadius = CGFloat(buttonSize / 2)
        }
        myChatLabel.snp.makeConstraints { make in
            make.leading.bottom.equalTo(view.safeAreaLayoutGuide).inset(50)
        }
        myChatButton.snp.makeConstraints { make in
            make.centerX.equalTo(myChatLabel)
            make.bottom.equalTo(myChatLabel.snp.top).offset(-10)
        }
        profileImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(myChatButton.snp.top).offset(-100)
            make.size.equalTo(150)
            profileImageView.clipsToBounds = true
            profileImageView.layer.cornerRadius = 60
        }
        userLabel.snp.makeConstraints { make in
            make.centerX.equalTo(profileImageView)
            make.top.equalTo(profileImageView.snp.bottom).offset(15)
        }
        setProfileLabel.snp.makeConstraints { make in
            make.centerY.equalTo(myChatLabel)
            make.centerX.equalTo(profileImageView)
        }
        setProfileButton.snp.makeConstraints { make in
            make.centerX.equalTo(setProfileLabel)
            make.centerY.equalTo(myChatButton)
        }
        storyLabel.snp.makeConstraints { make in
            make.centerY.equalTo(myChatLabel)
            make.trailing.bottom.equalTo(view.safeAreaLayoutGuide).inset(50)
        }
        storyButton.snp.makeConstraints { make in
            make.centerX.equalTo(storyLabel)
            make.centerY.equalTo(myChatButton)
        }
    }
    
}
