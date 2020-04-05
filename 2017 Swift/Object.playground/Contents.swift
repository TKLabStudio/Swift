//: Playground - noun: a place where people can play

import UIKit

class Position{ //有Func等適用
    var x = 0.0
    var y = 0.0
    var z = 0.0

}

var posA = Position()
print(posA.x ,posA.y , posA.z)
posA.x = 10
posA.y = 20
posA.z = 30
print(posA.x ,posA.y , posA.z)
print(posA)

var posC = posA
print(posC.x , posC.y , posC.z)
posC.x = 99
posC.y = 99
posC.z = 99
print(posC.x , posC.y , posC.z)
print(posA.x , posA.y , posA.z) //參考（指標）的動作會影響結果（共用記憶體）

class Cube{
    struct Pos {
        var x = 0.0
        var y = 0.0
        var z = 0.0
    }
    var pos = Pos() //蓋大樓
    var w = 0.0
    var h = 0.0
    var l = 0.0
    func size() -> Double {
        return w*h*l
    }
}

var cube = Cube()
cube.pos.x = 4
cube.pos.y = 5
cube.pos.z = 6
cube.w = 1
cube.h = 2
cube.l = 3
print(cube.h, cube.w , cube.pos.x)
print("v =", cube.size())
