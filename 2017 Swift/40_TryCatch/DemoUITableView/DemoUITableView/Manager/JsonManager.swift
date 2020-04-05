//
//  JsonManager.swift
//  GetDataFromServew
//
//  Created by smallHappy on 2017/8/20.
//  Copyright © 2017年 SmallHappy. All rights reserved.
//

import UIKit

class JsonManager: NSObject {

    private static let instance = JsonManager()
    static var shareInstance: JsonManager {
        return self.instance
    }
    
    enum HTTPMethod: String {
        case get = "GET", post = "POST"
    }
    
    func getJsonObject(method: HTTPMethod = .post, url: URL, body: Data? = nil, seccond: Double = 15, finish: ((_ object:Any?) -> Void)?) {
        var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: seccond)
        request.httpMethod = method.rawValue
        request.httpBody = body
        let task = URLSession.shared.dataTask(with: request, completionHandler: {data, response, error in
            //取得資料失敗
            if let error = error {
                print(error)
                finish?(nil)
                return
            }
            guard let data = data else {
                finish?(nil)
                return
            }
            //取得資料成功
            do {
                finish?(try JSONSerialization.jsonObject(with: data, options: .mutableContainers))
            } catch {
                print(error)
                finish?(nil)
            }
        })
        task.resume()
    }
    
}
