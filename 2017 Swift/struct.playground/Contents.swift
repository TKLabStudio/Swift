//: Playground - noun: a place where people can play

import UIKit

struct Position { //藍圖 //純資料適用
    var x = 0.0
    var y = 0.0
    var z = 0.0
}

var posA = Position() //大樓
print(posA.x , posA.y , posA.z)
posA.x = 10
posA.y = 20
posA.z = 30
print(posA.x , posA.y , posA.z)
print(posA)
var posB = Position(x: 30, y: 40, z: 50)
print(posB.x , posB.y , posB.z)

var posC = posA
print(posC.x , posC.y , posC.z)
posC.x = 99
posC.y = 99
posC.z = 99
print(posC.x , posC.y , posC.z)
print(posA.x , posA.y , posA.z) //Copy的動作不影響結果

