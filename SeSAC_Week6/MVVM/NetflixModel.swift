//
//  NetflixModel.swift
//  SeSAC_Week6
//
//  Created by 선상혁 on 2023/09/12.
//

import Foundation

class NeflixInput {
    var email: String
    var nickName: String
    var pw: String
    var location: String
    var code: String
    
    init(email: String, nickName: String, pw: String, location: String, code: String) {
        self.email = email
        self.nickName = nickName
        self.pw = pw
        self.location = location
        self.code = code
    }
    
    var checkValidation: Bool {
        if email.count >= 6 && nickName.count >= 2 && pw.count >= 8 && location.count >= 2 && code.count >= 4 {
            return true
        } else {
            return false
        }
    }
}

class NetflixModel {
    
    var list = Observable(NeflixInput(email: "", nickName: "", pw: "", location: "", code: ""))
    var isValid = Observable(false)
    
    func isValidInput() {
        isValid.value = list.value.checkValidation
    }
    
    func signIn(completion: () -> Void) {
        UserDefaults.standard.set(list.value.email, forKey: "email")
        UserDefaults.standard.set(list.value.nickName, forKey: "nickname")
        UserDefaults.standard.set(list.value.pw, forKey: "password")
        UserDefaults.standard.set(list.value.location, forKey: "location")
        UserDefaults.standard.set(list.value.code, forKey: "recommendcode")

        completion()
    }
}
