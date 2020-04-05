//
//  ViewController.swift
//  Class_9_UserPasswordDemo
//
//  Created by TK on 2015/12/13.
//  Copyright © 2015年 TK. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var fm = NSFileManager()
    var homePath = NSHomeDirectory() + "/Documents/"
    @IBOutlet weak var userNameSearsh: UITextField!
    @IBOutlet weak var textFieldUser: UITextField!
    @IBOutlet weak var dataList: UITextView!
    @IBOutlet weak var srcFile: UITextField!
    @IBOutlet weak var delName: UITextField!
    @IBOutlet weak var dstDir: UITextField!
    @IBOutlet weak var srcDir: UITextField!
    @IBOutlet weak var textFieldPW: UITextField!
    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var dstFile: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

                print(NSHomeDirectory())
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func createData(sender: UIButton) {
        if textFieldName.text?.hasPrefix(".txt") == false //hasPrefix偵測是否有.txt這後輟字
        {
            textFieldName.text = textFieldName.text! + ".txt"
        }
        let path = homePath + textFieldName.text!
        let str = textFieldUser.text! + "\n" + textFieldPW.text!
        try! str.writeToFile(path, atomically: true, encoding: NSUTF8StringEncoding)
    }
    
    @IBAction func AllUserData(sender: UIButton) {
        dataList.text = ""
        let all = fm.subpathsAtPath(homePath) //撈取homePath裡的清單變成陣列
        for file in all! //取陣列值
        {
            dataList.text = dataList.text + file + "\n"
        }
    }
    

    @IBAction func createDir(sender: UIButton) {
        let path = homePath + textFieldName.text!
        if !fm.fileExistsAtPath(path)
        {
            try!fm.createDirectoryAtPath(path, withIntermediateDirectories: true, attributes: nil)
        }
    }
    @IBAction func SearchData(sender: UIButton) {
        let path = homePath + userNameSearsh.text! + ".txt"
        let str = try!NSString(contentsOfFile: path, encoding: NSUTF8StringEncoding)
        let aryStr = str.componentsSeparatedByString("\n")
        dataList.text = "帳號：\(aryStr[0])\n密碼：\(aryStr[1])"
    }

    @IBAction func copyFile(sender: UIButton) {
        let srcPath = homePath + srcFile.text! + ".txt"
        let dstPath = homePath + dstFile.text! + ".txt"
        try!fm.copyItemAtPath(srcPath, toPath: dstPath)
    }
    @IBAction func moveFile(sender: UIButton) {
        let srcPath = homePath + srcFile.text! + ".txt"
        let dstPath = homePath + dstFile.text! + ".txt"
        try!fm.moveItemAtPath(srcPath, toPath: dstPath)
    }
    @IBAction func copyDir(sender: UIButton) {
        let srcPath = homePath + srcDir.text!
        let dstPath = homePath + dstDir.text!
        try!fm.copyItemAtPath(srcPath, toPath: dstPath)
    }
    @IBAction func moveDir(sender: UIButton) {
        let srcPath = homePath + srcDir.text!
        let dstPath = homePath + dstDir.text!
        try!fm.moveItemAtPath(srcPath, toPath: dstPath)
    }
    @IBAction func delFileDir(sender: UIButton) {
        let path = homePath + delName.text!
        try!fm.removeItemAtPath(path)
    }
    
}

