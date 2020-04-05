//
//  ViewController.swift
//  DemoUIAlertController
//
//  Created by smallHappy on 2017/8/17.
//  Copyright © 2017年 SmallHappy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var alertButton: UIButton!
    var actionsheetButton: UIButton!
    var accountTextfield: UITextField!
    var passwordTextfield: UITextField!
    var webView: UIWebView!
    var Accountfunc: Account!
    let user: String = ""
    let pass: String = ""
    enum ButtonTag: Int {
        case alert = 1, actionsheet
    }
    
    enum ActionsheetTag {
        case account, delete, cancel
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.initUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.setUI()
    }
    
    
    //MARK: - fcuntion
    private func initUI() {
        self.alertButton = UIButton()
        self.alertButton.setTitle("show alert", for: .normal)
        self.alertButton.setTitleColor(UIColor.darkGray, for: .normal)
        self.alertButton.tag = ButtonTag.alert.rawValue
        self.alertButton.addTarget(self, action: #selector(self.onButtonAction(_:)), for: .touchUpInside)
        self.view.addSubview(self.alertButton)
        
        self.actionsheetButton = UIButton()
        self.actionsheetButton.setTitle("show actionsheet", for: .normal)
        self.actionsheetButton.setTitleColor(UIColor.darkGray, for: .normal)
        self.actionsheetButton.tag = ButtonTag.actionsheet.rawValue
        self.actionsheetButton.addTarget(self, action: #selector(self.onButtonAction(_:)), for: .touchUpInside)
        self.view.addSubview(self.actionsheetButton)
        
        self.webView = UIWebView()
        self.webView.layer.borderWidth = 1.0
        self.webView.layer.backgroundColor = UIColor.darkGray.cgColor
        self.webView.layer.cornerRadius = 8.0
        self.webView.scrollView.layer.cornerRadius = 8.0 //拖動完後也要出現圓角
        self.view.addSubview(self.webView)
    }
    
    private func setUI() {
        self.alertButton.frame = CGRect(x: 0, y: 80, width: UIScreen.main.bounds.width, height: 30)
        self.actionsheetButton.frame = CGRect(x: 0, y: 80 + 30 + 10, width: UIScreen.main.bounds.width, height: 30)
        self.webView.frame = CGRect(x: 20, y: actionsheetButton.frame.maxY, width: UIScreen.main.bounds.width - 20 - 20, height: UIScreen.main.bounds.height - self.actionsheetButton.frame.maxY - 20)
        let request = URLRequest(url: URL(string:"http://tklab.club")!)
        self.webView.loadRequest(request)
        self.webView.isHidden = true

    }
    
    private func triggerAlert() {
        let alert = UIAlertController(title: "Wrong!!", message: "You will get in TK Lab. Are you sure?", preferredStyle: .alert)
        let enterBottom = UIAlertAction(title: "Enter", style: .default) { _ in
            if self.accountTextfield.text == "", self.passwordTextfield.text == ""
            {
                print("You didn't creat Account!")
            }
            else if self.accountTextfield.text == self.Accountfunc.account, self.passwordTextfield.text == self.Accountfunc.pass
            {
                print("You got in TK Lab!")
                self.webView.isHidden = false
            } else {
                print("Wrong User")
                self.view.backgroundColor = UIColor.black
                self.actionsheetButton.isHidden = true
                self.alertButton.isHidden = true
            }
        }
        alert.addAction(enterBottom)
        
        let cancelButtom = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            print("Cancel")
            self.errorPassAlert()
        }
        alert.addAction(cancelButtom)
        
        let fineButtom = UIAlertAction(title: "Fine", style: .destructive, handler: nil)
        fineButtom.setValue(UIColor.darkGray, forKey: "_titleTextColor") //祕技：修改title color
        alert.addAction(fineButtom)
        
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
        
        self.present(alert, animated: true, completion: nil)

    }
    private func errorPassAlert(){
        let alert = UIAlertController(title: "Exit", message: "Now you will exit this system!", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .cancel) { _ in
            print("Exit")
            exit(0)
        }
        alert.addAction(ok)
        let _return = UIAlertAction(title: "Return", style: .default, handler: nil)
        alert.addAction(_return)
        self.present(alert, animated: true, completion: nil)
    }
    
    private func triggerActionsheet() {
        let actionsheet = UIAlertController(title: "Account", message: "Manager your Account", preferredStyle: .actionSheet)
        let createAccount = UIAlertAction(title: "Create Account", style: .default, handler: self.actionsheetHandler(tag: .account))
        actionsheet.addAction(createAccount)
        let deleteAccount = UIAlertAction(title: "Delete Account", style: .destructive, handler: actionsheetHandler(tag: .delete))
        actionsheet.addAction(deleteAccount)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: actionsheetHandler(tag: .cancel))
        actionsheet.addAction(cancel)
        actionsheet.popoverPresentationController?.sourceView = self.view //從view跳出（如果未加會造成平板閃退）
        self.present(actionsheet, animated: true, completion: nil)
    }
    func actionsheetHandler(tag: ActionsheetTag) -> (UIAlertAction) -> Void{ //工廠產出Handler
        return {
            alert -> Void in
            self.Accountfunc = Account()
            switch tag {
            case .account:
                self.present(self.Accountfunc.creatAlert(), animated: true, completion: nil)
            case .delete:
                self.present(self.Accountfunc.deleteAlert(), animated: true, completion: nil)
            case .cancel:
                self.errorPassAlert()
            }
        }
    }
    
    //MARK: - selector
    func onButtonAction(_ sender: UIButton) {
        guard let tag = ButtonTag(rawValue: sender.tag) else { return }
        switch tag {
        case .alert:
            self.triggerAlert()
        case .actionsheet:
            self.triggerActionsheet()
        }
    }

}

