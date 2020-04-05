//
//  ViewController.swift
//  Class_6_AlertView2Demo
//
//  Created by TK on 2015/12/1.
//  Copyright © 2015年 TK. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIAlertViewDelegate {
        let myName = "mosca"
        let myPass = "qaz741"
    @IBOutlet weak var loginMsg: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func login(sender: UIButton) {
        let Alert = UIAlertView()
        Alert.title = "認證"
        Alert.message = "請輸入帳號密碼："
        Alert.delegate = self
        Alert.addButtonWithTitle("取消")
        Alert.addButtonWithTitle("確定")
        Alert.alertViewStyle = UIAlertViewStyle.LoginAndPasswordInput
        Alert.show()
    }
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        switch buttonIndex
        {
            case 0:
                break
            case 1:
                let userName = alertView.textFieldAtIndex(0)
                let userPassword = alertView.textFieldAtIndex(1)
            if userName?.text == myName && userPassword?.text == myPass
            {
                loginMsg.text = "登入成功！"
            }else
            {
                loginMsg.text = "登入失敗！"
            }
        default:
            break
        }
        
    }
}

