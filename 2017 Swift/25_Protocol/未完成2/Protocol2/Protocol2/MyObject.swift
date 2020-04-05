//
//  MyObject.swift
//  Protocol2
//
//  Created by XCODE on 2017/10/31.
//  Copyright © 2017年 Gjun. All rights reserved.
//

import Foundation

protocol MyObjectDelegate {
    func purposeToTransferData(_ result: Double?)
}

class MyObject {
    
    var delegate: MyObjectDelegate?
    
    func doSomethingHandleByMyObject() {
        // 讓使用者輸入，但不知道需要等待多少時間！
        var radius = 0.0
        getInput(&radius)
        // 運算結果
        let result = pow(radius, 2.0) * Double.pi
        self.delegate?.purposeToTransferData(result)
    }
    
}














