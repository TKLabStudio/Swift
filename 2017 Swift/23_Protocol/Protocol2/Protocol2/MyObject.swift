//
//  MyObject.swift
//  Protocol2
//
//  Created by XCODE on 2017/9/9.
//  Copyright © 2017年 Gjun. All rights reserved.
//

import Foundation

protocol MyObjectDelegate {
    func purposeToTransferData(_ result: Double?)
}

class MyObject {
    var data: Double?
    var delegate: MyObjectDelegate?
    func doSomethingByMyObject() {
        // 假裝在處理資料，耗時，但不知道會花多少時間！
        let random = Int(arc4random()) % 4 + 2
        print("random:", random, "sec")
        Thread.sleep(forTimeInterval: TimeInterval(random))
        // 運算結果
        if let radius = self.data {
            let result = pow(radius, 2) * Double.pi
            self.delegate?.purposeToTransferData(result)
        }
    }
}







