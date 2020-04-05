//: Playground - noun: a place where people can play

import UIKit

var numberArray = [3,2,5,7,87,9,-1]
numberArray.sorted() //回傳被改變陣列，原陣列不被改變
numberArray
numberArray.sort() //原陣列被改變
numberArray
numberArray.reverse()
numberArray.index(of: -1)
let index = numberArray.index(of: 5)
print(index)
numberArray.map { (number) -> Bool in
    let is0dd = number % 2 == 1
    return is0dd
}

for i in 1 ... 10{
    print(i)
}

(1 ... 10).forEach { (i) in
    print(i)
}

(1 ... 10).reversed().forEach {
    print($0)
}

class MyObject{
    let array:[Any] = [1,2,3,"TK","NCUT",true]
    func demoForLoop()
    {
        print("======", #function , "-Start", "======")
        for element in array {
            if let tk = element as? String, tk == "TK" //break
            {
                //print(element)
                continue //可用continue
                //return //如果用return，是跳出整個demoForLoop
            }
            print(element)
        }
        print("======", #function , "-End", "======")
    }
    
    
    
    func demoForEach()
    {
        print("======", #function , "-Start", "======")
        array.forEach { (element) in
            if let tk = element as? String, tk == "TK" //break
            {
                return //改用return
                //print(element)
            }
            print(element)

        }
        print("======", #function , "-End", "======")
    }
}
let obj = MyObject()
obj.demoForLoop()
obj.demoForEach()
