//
//  main.swift
//  Protocol2
//
//  Created by XCODE on 2017/10/31.
//  Copyright © 2017年 Gjun. All rights reserved.
//

import Foundation

class MyContoller: MyObjectDelegate{
    let object = MyObject()
    init() {
        object.delegate = self
    }
    func purposeToTransferData(_ result: Double?){
        print(#file, result!)
    }
 
    
}
let controller = MyContoller()
controller.object.doSomethingHandleByMyObject()










