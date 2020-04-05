//
//  Account.swift
//  DemoUIAlertController
//
//  Created by TK on 2017/12/15.
//  Copyright © 2017年 SmallHappy. All rights reserved.
//

import UIKit

class Account: NSObject {
    var account: String!
    var pass: String!
    var accountTextfield: UITextField!
    var passwordTextfield: UITextField!
    
    func creatAlert() -> UIAlertController {
        let alert = UIAlertController(title: "Creat Account", message: "Enter you want to creat Acount", preferredStyle: .alert)
        let enterBottom = UIAlertAction(title: "Enter", style: .default) { _ in
            self.creatAccount(account: self.accountTextfield.text!, pass: self.passwordTextfield.text!)
        }
        alert.addAction(enterBottom)
        
        let cancelButtom = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            print("Cancel")
        }
        alert.addAction(cancelButtom)
        
        alert.addTextField { textField in
            self.accountTextfield = textField
            textField.placeholder = "Account"
            textField.isSecureTextEntry = false
        }
        alert.addTextField { textField in
            self.passwordTextfield = textField
            textField.placeholder = "Password"
            textField.isSecureTextEntry = true
        }
        
        return alert
    }
    
    func deleteAlert() -> UIAlertController {
        let alert = UIAlertController(title: "Wrong!!", message: "It will kill your Account", preferredStyle: .alert)
        let enterBottom = UIAlertAction(title: "OK", style: .destructive) { _ in
            self.deleteAccount()
        }
        alert.addAction(enterBottom)
        
        let cancelButtom = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            print("Cancel")
        }
        alert.addAction(cancelButtom)
        return alert
    }
    
    func creatAccount(account: String, pass: String){
        self.account = account
        self.pass = pass
        print(self.account, self.pass)
    }
    
    func deleteAccount(){
        self.account = ""
        self.pass = ""
    }
}
