//
//  main.swift
//  Protocol1
//
//  Created by XCODE on 2017/9/9.
//  Copyright © 2017年 Gjun. All rights reserved.
//

import Foundation

protocol Rec {
    func getRecArea(width: Float, height: Float) -> Float
    func getRecPerimeter(width: Float, height: Float) -> Float
}
protocol Circle {
    func getCirArea(radius: Float) -> Float
    func getCirPerimeter(radius: Float) -> Float
}
class Object: Rec, Circle {
    func getRecArea(width: Float, height: Float) -> Float {
        return width * height
    }
    func getRecPerimeter(width: Float, height: Float) -> Float {
        return (width + height) * 2
    }
    func getCirArea(radius: Float) -> Float {
        return powf(radius, 2) * Float.pi
    }
    func getCirPerimeter(radius: Float) -> Float {
        return radius * 2 * Float.pi
    }
}
let obj = Object()
print(obj.getRecArea(width: 3, height: 4))
print(obj.getRecPerimeter(width: 3, height: 4))
print(obj.getCirArea(radius: 10))
print(obj.getCirPerimeter(radius: 10))











