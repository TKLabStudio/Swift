//
//  ViewController.swift
//  Class_7_AlertController7Demo
//
//  Created by TK on 2015/12/1.
//  Copyright © 2015年 TK. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var user = "tk"
    var password = "qaz741"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewDidAppear(animated: Bool) {
        let alertVC = UIAlertController(title: "驗證", message: "輸入帳號密碼", preferredStyle: UIAlertControllerStyle.Alert)
        alertVC.addTextFieldWithConfigurationHandler { (textField) -> Void in
            textField.placeholder = "Login" //textFields[0]
        }
        alertVC.addTextFieldWithConfigurationHandler { (textField) -> Void in
            textField.placeholder = "Password" //textFields[1]
            textField.secureTextEntry = true
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Destructive) { (cancel) -> Void in
                alertVC.dismissViewControllerAnimated(true, completion: nil) //動態釋放記憶體
        }
        let loginAction = UIAlertAction(title: "Login", style: UIAlertActionStyle.Default) { (login) -> Void in
            let login = alertVC.textFields![0].text
            let pass = alertVC.textFields![1].text
            if login == self.user && pass == self.password
            {
                let VC2:Num2View = self.storyboard?.instantiateViewControllerWithIdentifier("View2") as! Num2View //「:Num2View」指定資料型態（第二頁） 「instantiateViewControllerWithIdentifier("View2")」插入指定ID的View 「as!」強制轉換資料型態成Num2View
                VC2.userData(login!, p1: pass!) //傳值到Num2View
                self.presentViewController(VC2, animated: true, completion: nil) //連結VC2執行更換頁面
            }else
            {
                print("error")
            }
        }
        alertVC.addAction(cancelAction)
        alertVC.addAction(loginAction)
        self.presentViewController(alertVC, animated: true, completion: nil)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

