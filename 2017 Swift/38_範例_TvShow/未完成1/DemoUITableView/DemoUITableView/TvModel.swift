//
//  TvModel.swift
//  DemoUITableView
//
//  Created by smallHappy on 2017/8/18.
//  Copyright © 2017年 SmallHappy. All rights reserved.
//

import UIKit

class TvModel: NSObject {

    var program = [String]()
    var news = [String]()
    var sports = [String]()
    var recreations = [String]()
    
    func setProgramData(jsonObject: Any?) {
        guard let jsonObject = jsonObject as? [String] else {
            return
        }
        self.program = jsonObject
    }
    
    func setNewsData(jsonObject: Any?) {
        guard let jsonObject = jsonObject as? [String] else {
            return
        }
        self.news = jsonObject
    }
    
    func setSportsData(jsonObject: Any?) {
        guard let jsonObject = jsonObject as? [String] else {
            return
        }
        self.sports = jsonObject
    }
    
    func setRecreationsData(jsonObject: Any?) {
        guard let jsonObject = jsonObject as? [String] else {
            return
        }
        self.recreations = jsonObject
    }
    
}



