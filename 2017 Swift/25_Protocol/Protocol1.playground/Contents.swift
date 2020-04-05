//: Playground - noun: a place where people can play

import UIKit

protocol Rec {
    func getRecArea(width: Float, height: Float) -> Float
    func getRecPerimeter(width: Float, height: Float) -> Float
}
protocol Circle {
    func getCirArea(radius: Float) -> Float
    func getCirPerimeter(radius: Float) -> Float
}
// 如果有繼承物件，應把繼承物件寫在最前方。
class Object: Rec, Circle {
    func getRecArea(width: Float, height: Float) -> Float {
        return width * height
    }
    func getRecPerimeter(width: Float, height: Float) -> Float {
        return (width + height) * 2
    }
    func getCirArea(radius: Float) -> Float {
        return powf(radius, 2.0) * Float.pi
    }
    func getCirPerimeter(radius: Float) -> Float {
        return radius * 2 * Float.pi
    }
}
let obj = Object()
obj.getRecArea(width: 3, height: 4)
obj.getRecPerimeter(width: 3, height: 4)
obj.getCirArea(radius: 3)
obj.getCirPerimeter(radius: 3)



