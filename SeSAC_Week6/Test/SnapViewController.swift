//
//  SnapViewController.swift
//  SeSAC_Week6
//
//  Created by 선상혁 on 2023/08/22.
//

import UIKit
import SnapKit

/*
 addSubView
 superView
 offset inset
 RTL
 */

class SnapViewController: UIViewController {

    let redView = UIView()
    let whiteView = UIView()
    let blueView = UIView()
    let yellowView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .lightGray
        
        view.addSubview(redView)
        redView.backgroundColor = .red
        redView.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(200)
            make.centerX.equalTo(view)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
        view.addSubview(whiteView)
        whiteView.backgroundColor = .white
        whiteView.snp.makeConstraints { make in
            make.height.equalTo(200)
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
        }
        
        view.addSubview(blueView)
        blueView.backgroundColor = .blue
        blueView.snp.makeConstraints { make in
            make.size.equalTo(200)
            make.center.equalTo(view)
        }
        
        blueView.addSubview(yellowView)
        yellowView.backgroundColor = .yellow
        yellowView.snp.makeConstraints { make in
            //make.size.equalTo(150)
            //make.leading.top.equalToSuperview()
            make.edges.equalToSuperview().inset(50)
            //leading.trailing.top.bottom
            
            make.leading.top.equalTo(blueView).offset(50)
        }
    }
    
}
