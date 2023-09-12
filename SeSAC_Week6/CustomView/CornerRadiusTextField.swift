//
//  CornerRadiusTextField.swift
//  SeSAC_Week6
//
//  Created by 선상혁 on 2023/09/12.
//

import UIKit

class CornerRadiusTextField: UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        delegate = self
        setUpTextField()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpTextField() {
        layer.cornerRadius = 5
        backgroundColor = .gray
        textAlignment = .center
    }
}

extension CornerRadiusTextField: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        placeholder = ""
    }
}
