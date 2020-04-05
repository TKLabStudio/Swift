//: Playground - noun: a place where people can play

import UIKit

struct Point{
    var x = 0.0
    var y = 0.0
}

struct Size {
    var w = 0.0
    var h = 0.0
}

struct Rect{
    var orign: Point //結構內的建構方式，可以沒有初始值
    var size = Size(w: 0.0, h: 0.0)
    var center: Point {
        get{ //內建的方法
            return Point(x: orign.x + size.w / 2, y: orign.y + size.h / 2)
        }
        set{ //(newValue)
            orign.x = newValue.x - size.w / 2
            orign.y = newValue.y - size.h / 2
        }
    }
}


var rect = Rect(orign: Point(x: 100,y: 100), size: Size(w: 60, h: 40))
print(rect.orign.x, rect.orign.y)
print(rect.size.w,rect.size.h)
print(rect.center.x,rect.center.y)
rect.center = Point(x: 200, y: 200)
print(rect.orign.x, rect.orign.y)
print(rect.size.w,rect.size.h)
print(rect.center.x,rect.center.y)

