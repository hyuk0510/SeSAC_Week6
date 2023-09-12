//
//  Observable.swift
//  SeSAC_Week6
//
//  Created by 선상혁 on 2023/09/12.
//

import Foundation

class Observable<T> {
    
    private var linker: ((T) -> Void)?
    
    var value: T {
        didSet {
            linker?(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(completion: @escaping (T) -> Void) {
        completion(value)
        linker = completion
    }
}
