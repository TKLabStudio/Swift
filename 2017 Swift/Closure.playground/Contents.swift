//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
func downloadfile1(finish: (Data?) -> Void, link:String){
    let file = link.data(using: .utf8) //假裝下載
    finish(file)
}
downloadfile1(finish: { (file) in
    print(file!, "Send email with this file")
}, link: "http://59.127.100.96")

func downloadfile2(link:String, finish:(Data?) -> Void) {
    let file = link.data(using: .utf8) //假裝下載
    finish(file)
}

downloadfile2(link: "http://59.127.100.96") { (file) in
    print(file!, "Save file")

}
func downloadfile3(link:String, finish:(Data?) -> Bool) {
    let file = link.data(using: .utf8) //假裝下載
    if finish(file){
        print("處理成功")
    }else{
        print("Fail")
    }
}
downloadfile3(link: "http://59.127.100.96") { (file) -> Bool in
    if file != nil{
        return true
    }else{
        return false
    }
}

downloadfile3(link: "http://59.127.100.96") { (file) -> Bool in
     file != nil
}

downloadfile3(link: "http://59.127.100.96") {
    $0 != nil
}