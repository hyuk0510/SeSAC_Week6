//
//  MovieAutoLayoutViewController.swift
//  SeSAC_Week6
//
//  Created by 선상혁 on 2023/08/24.
//

import UIKit
import SnapKit

class MovieAutoLayoutViewController: UIViewController {

    let imageSize = (UIScreen.main.bounds.width - CGFloat(8 * 4)) / 3
    
    let backPoster = {
        let view = UIImageView()
        view.image = UIImage(named: "극한직업")
        view.contentMode = .scaleToFill
        return view
    }()
    
    let backView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.1404079795, green: 0.1404079795, blue: 0.1404079795, alpha: 0.5082522765)
        return view
    }()
    
    let homeLabel = {
        let label = UILabel()
        label.text = "N"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 50)
        return label
    }()
    
    let tvButton = {
        let button = UIButton()
        button.setTitle("TV 프로그램", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 15)
        return button
    }()
    
    let movieButton = {
        let button = UIButton()
        button.setTitle("영화", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 15)
        return button
    }()
    
    let myContentsButton = {
        let button = UIButton()
        button.setTitle("내가 찜한 콘텐츠", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 15)
        return button
    }()
    
    let showMyContentsButton = {
        let button = UIButton()
        var config = UIButton.Configuration.filled()
        config.baseBackgroundColor = .clear
        config.subtitle = "내가 찜한 컨텐츠"
        config.image = UIImage(systemName: "checkmark")
        config.imagePadding = 8
        config.imagePlacement = .top
        config.baseForegroundColor = .white
        button.configuration = config
        
        return button
    }()
    
    let infoButton = {
        let button = UIButton()
        var config = UIButton.Configuration.filled()
        config.baseBackgroundColor = .clear
        config.subtitle = "정보"
        config.image = UIImage(systemName: "info.circle")
        config.imagePadding = 8
        config.imagePlacement = .top
        config.baseForegroundColor = .white
        button.configuration = config
        return button
    }()
    
    let playButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "play_normal"), for: .normal)
        return button
    }()
    
    let previewLabel = {
        let label = UILabel()
        label.text = "미리보기"
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .white
        return label
    }()
    
    let previewImage1 = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "겨울왕국")
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    let previewImage2 = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "아바타")
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    let previewImage3 = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "괴물")
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let subViewList = [backPoster, backView, homeLabel, tvButton, movieButton, myContentsButton, showMyContentsButton, infoButton, playButton, previewLabel, previewImage1, previewImage2, previewImage3]
        
        for item in subViewList {
            view.addSubview(item)
        }
        
        setConstraints()
    }
    
    func setConstraints() {
        backPoster.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        backView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        homeLabel.snp.makeConstraints { make in
            make.top.leading.equalTo(view.safeAreaLayoutGuide).inset(8)
        }
        tvButton.snp.makeConstraints { make in
            make.centerY.equalTo(homeLabel)
            make.leading.equalTo(homeLabel.snp.trailing).offset(50)
        }
        movieButton.snp.makeConstraints { make in
            make.centerY.equalTo(homeLabel)
            make.leading.equalTo(tvButton.snp.trailing).offset(20)
        }
        myContentsButton.snp.makeConstraints { make in
            make.centerY.equalTo(homeLabel)
            make.leading.equalTo(movieButton.snp.trailing).offset(20)
        }
        previewImage1.snp.makeConstraints { make in
            make.leading.bottom.equalTo(view.safeAreaLayoutGuide).inset(8)
            make.size.equalTo(imageSize)
            setCornerRadius(image: previewImage1)
        }
        previewImage2.snp.makeConstraints { make in
            make.centerY.equalTo(previewImage1)
            make.leading.equalTo(previewImage1.snp.trailing).offset(8)
            make.size.equalTo(imageSize)
            setCornerRadius(image: previewImage2)
        }
        previewImage3.snp.makeConstraints { make in
            make.centerY.equalTo(previewImage1)
            make.leading.equalTo(previewImage2.snp.trailing).offset(8)
            make.size.equalTo(imageSize)
            setCornerRadius(image: previewImage3)
        }
        previewLabel.snp.makeConstraints { make in
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(8)
            make.bottom.equalTo(previewImage1.snp.top).offset(-8)
        }
        showMyContentsButton.snp.makeConstraints { make in
            make.centerX.equalTo(previewImage1)
            make.bottom.equalTo(previewLabel.snp.top).offset(-20)
        }
        playButton.snp.makeConstraints { make in
            make.centerY.equalTo(showMyContentsButton)
            make.centerX.equalTo(previewImage2)
        }
        infoButton.snp.makeConstraints { make in
            make.centerY.equalTo(showMyContentsButton)
            make.centerX.equalTo(previewImage3)
        }
        
    }
    
    func setCornerRadius(image: UIImageView) {
        image.clipsToBounds = true
        image.layer.cornerRadius = imageSize / 2
        image.layer.borderColor = UIColor.gray.cgColor
        image.layer.borderWidth = 2
    }
}
