//
//  main.swift
//  Protocol2
//
//  Created by XCODE on 2017/9/9.
//  Copyright © 2017年 Gjun. All rights reserved.
//

import Foundation

class DataController: MyObjectDelegate {
    let object = MyObject()
    init() {
        self.object.data = 10
        self.object.delegate = self
    }
    func purposeToTransferData(_ result: Double?) {
        // 傳遞資料： object -> controller
        print("result from MyObject:", result ?? "unkown")
    }
}
let controller = DataController()
controller.object.doSomethingByMyObject()






