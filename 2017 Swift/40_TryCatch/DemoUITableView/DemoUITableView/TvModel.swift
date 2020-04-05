//
//  TvModel.swift
//  DemoUITableView
//
//  Created by smallHappy on 2017/8/18.
//  Copyright © 2017年 SmallHappy. All rights reserved.
//

import UIKit

class TvModel: NSObject {

    enum TvModelError: Error {
        case programIsNil, programParseFail //空的or解析失敗
        case newsIsNil, newsParseFail //空的or解析失敗
        case sportsIsNil, sportsParseFail //空的or解析失敗
        case recreationsIsNil, recreationsParseFail //空的or解析失敗

    }
    var program = [String]()
    var news = [String]()
    var sports = [String]()
    var recreations = [String]()
    
    func setProgramData(jsonObject: Any?) throws {
        guard let jsonObject = jsonObject  else {//確定jsonObject是否為nil
            throw TvModelError.programIsNil //throw與retuen一樣，但可以把error丟出來
        }
        guard let promgram = jsonObject as? [String] else{ //再轉型
            throw TvModelError.programParseFail
        }
        self.program = promgram
    }
    
    func setNewsData(jsonObject: Any?) throws {
        guard let jsonObject = jsonObject  else {//確定jsonObject是否為nil
            throw TvModelError.newsIsNil //throw與retuen一樣，但可以把error丟出來
        }
        guard let news = jsonObject as? [String] else{ //再轉型
            throw TvModelError.newsParseFail
        }
        self.news = news
    }
    
    func setSportsData(jsonObject: Any?) throws {
        guard let jsonObject = jsonObject  else {//確定jsonObject是否為nil
            throw TvModelError.sportsIsNil //throw與retuen一樣，但可以把error丟出來
        }
        guard let sports = jsonObject as? [String] else{ //再轉型
            throw TvModelError.sportsParseFail
        }
        self.sports = sports
    }
    
    func setRecreationsData(jsonObject: Any?) throws {
        guard let jsonObject = jsonObject  else {//確定jsonObject是否為nil
            throw TvModelError.recreationsIsNil //throw與retuen一樣，但可以把error丟出來
        }
        guard let recreations = jsonObject as? [String] else{ //再轉型
            throw TvModelError.recreationsParseFail
        }
        self.recreations = recreations
    }
    
}
