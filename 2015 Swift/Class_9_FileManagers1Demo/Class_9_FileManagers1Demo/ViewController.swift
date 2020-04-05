//
//  ViewController.swift
//  Class_9_FileManagers1Demo
//
//  Created by TK on 2015/12/13.
//  Copyright © 2015年 TK. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textFieldFile: UITextField!
    @IBOutlet weak var testFieldData: UITextField!
    @IBOutlet weak var textDirectoryFile: UITextField!
    var fm = NSFileManager()
    let homepath = NSHomeDirectory() + "/Documents/"
    override func viewDidLoad() {
        super.viewDidLoad()
        let userpath = homepath + "abc.txt"
//        fm.createFileAtPath(userpath, contents: nil, attributes: nil) //建立一個檔案
        let myData = try!String(contentsOfFile: userpath,encoding: NSUTF8StringEncoding) //讀取abc.txt裡的資料
        print(myData)
        print(NSHomeDirectory())
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func toFile(sender: UIButton) {
        let path = homepath + textFieldFile.text!
        if !fm.fileExistsAtPath(path)
        {
            fm.createFileAtPath(path, contents: nil, attributes: nil)
        }
    }
    @IBAction func toDirectory(sender: UIButton) {
        let path = homepath + textDirectoryFile.text!
        if !fm.fileExistsAtPath(path)
        {
//            try! fm.createDirectoryAtPath(path, withIntermediateDirectories: true, attributes: nil) //try!唯有例外就不做例外 withIntermediateDirectories為自動建立路徑 
            do{
                try fm.createDirectoryAtPath(path, withIntermediateDirectories: true, attributes: nil)
                
                let alertController = UIAlertController(title: "成功", message: "資料夾建立成功", preferredStyle: UIAlertControllerStyle.Alert)
                let alertOK = UIAlertAction(title: "確定", style: UIAlertActionStyle.Default, handler:
                    { (alertOK) -> Void in
                    alertController.dismissViewControllerAnimated(true, completion: nil)
                    })
                alertController.addAction(alertOK)
                self.presentViewController(alertController, animated: true, completion: nil)
            }catch
                {
                let alertController = UIAlertController(title: "失敗 ", message: "資料夾建立失敗", preferredStyle: UIAlertControllerStyle.Alert)
                let alertOK = UIAlertAction(title: "確定", style: UIAlertActionStyle.Default, handler:
                    { (alertOK) -> Void in
                    alertController.dismissViewControllerAnimated(true, completion: nil)
            })
                    alertController.addAction(alertOK)
                    self.presentViewController(alertController, animated: true, completion: nil)
            }//如果事件是正常的做do裡面的訊息，不正常做catch

        }
    }
    
    @IBAction func toData(sender: UIButton) {
        let path = homepath + "abc.txt"
        let str = testFieldData.text!
        try! str.writeToFile(path, atomically: true, encoding: NSUTF8StringEncoding)//writeToFile直接建立檔案 atomically是否先寫入緩衝區 try!唯有例外就不做例外
    }
}

