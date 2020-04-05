//
//  ViewController.swift
//  Login2
//
//  Created by smallHappy on 2017/1/15.
//  Copyright © 2017年 Polaris. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var titleLabel: UILabel!
    var accountTextField: UITextField!
    var passwordTextField: UITextField!
    var confirmButton: UIButton!
    var statuseLabel: UILabel!
    
    let account = "tkkun"
    let password = "194207"
    // TODO: - 待完成

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.titleLabel = UILabel()
        self.view.addSubview(self.titleLabel)
        self.titleLabel.text = "系統登入"
//        self.titleLabel.font = UIFont.systemFont(ofSize: UIFont.smallSystemFontSize)
//        self.titleLabel.font = UIFont.systemFont(ofSize: UIFont.systemFontSize)
//        self.titleLabel.font = UIFont.systemFont(ofSize: 17)
//        self.titleLabel.font = UIFont.italicSystemFont(ofSize: 17)
//        self.titleLabel.font = UIFont.boldSystemFont(ofSize: 17)
        self.titleLabel.font = UIFont(name: "Helvetica Neue", size: 17)
        self.titleLabel.textColor = UIColor.black
        self.titleLabel.textAlignment = .center
        self.titleLabel.lineBreakMode = .byWordWrapping
        self.titleLabel.numberOfLines = 0
        self.titleLabel.adjustsFontSizeToFitWidth = false
        //self.titleLabel.shadowColor = UIColor.lightGray
        //self.titleLabel.shadowOffset = CGSize(width: 2, height: 2)
        
        self.accountTextField = UITextField()
        self.view.addSubview(self.accountTextField)
        self.accountTextField.text = ""
        self.accountTextField.placeholder = "請輸入帳號"
        self.accountTextField.font = UIFont.boldSystemFont(ofSize: 17)
        self.accountTextField.textColor = UIColor.darkGray
        self.accountTextField.textAlignment = .left
        self.accountTextField.borderStyle = .line
        self.accountTextField.clearButtonMode = .always
        self.accountTextField.clearsOnBeginEditing = false
        self.accountTextField.keyboardType = .alphabet
        self.accountTextField.isSecureTextEntry = false
        
        self.passwordTextField = UITextField()
        self.view.addSubview(self.passwordTextField)
        self.passwordTextField.text = ""
        self.passwordTextField.placeholder = "請輸入密碼"
        self.passwordTextField.font = UIFont.boldSystemFont(ofSize: 17)
        self.passwordTextField.textColor = UIColor.darkGray
        self.passwordTextField.textAlignment = NSTextAlignment.left
        self.passwordTextField.borderStyle = UITextBorderStyle.line
        self.passwordTextField.clearButtonMode = UITextFieldViewMode.always
        self.passwordTextField.clearsOnBeginEditing = false
        self.passwordTextField.keyboardType = UIKeyboardType.decimalPad
        self.passwordTextField.isSecureTextEntry = true
        
        self.confirmButton = UIButton()
        self.view.addSubview(self.confirmButton)
        self.confirmButton.addTarget(self, action: #selector(self.onButtonAction(_:)), for: UIControlEvents.touchUpInside)
        self.confirmButton.setTitle("確認", for: UIControlState.normal)
        self.confirmButton.setTitleColor(UIColor.brown, for: .normal)
        self.confirmButton.setTitleColor(UIColor.red, for: .highlighted)
        
        self.statuseLabel = UILabel()
        self.view.addSubview(self.statuseLabel)
        self.statuseLabel.text = "..."
        self.statuseLabel.font = UIFont.boldSystemFont(ofSize: 17)
        self.statuseLabel.textColor = UIColor.black
        self.statuseLabel.textAlignment = NSTextAlignment.center
        self.statuseLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        self.statuseLabel.numberOfLines = 0
        self.statuseLabel.adjustsFontSizeToFitWidth = false
        self.statuseLabel.shadowColor = UIColor.lightGray
        self.statuseLabel.shadowOffset = CGSize(width: 2, height: 2)
    }

    override func viewWillAppear(_ animated: Bool) {
        let frameW = UIScreen.main.bounds.width
        let frameH = UIScreen.main.bounds.height
        let gap:CGFloat = 30
        self.titleLabel.frame = CGRect(x: 0, y: 20+30, width: frameW, height: 21)
        let accountY = self.titleLabel.frame.maxY + gap
        self.accountTextField.frame = CGRect(x: gap, y: accountY, width: frameW - gap*2, height: 45)
        let passwordTextY = self.accountTextField.frame.maxY + gap
        self.passwordTextField.frame = CGRect(x: gap, y: passwordTextY, width: frameW - gap*2, height: 45)
        let buttonY = self.passwordTextField.frame.maxY + gap
        self.confirmButton.frame = CGRect(x: frameW/6, y: buttonY, width: frameW*2/3, height: 45)
        let statusY = self.confirmButton.frame.maxY + gap
        self.statuseLabel.frame = CGRect(x: 0, y: statusY, width: frameW, height: 21)
        // TODO: - 待完成
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.accountTextField.becomeFirstResponder()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        self.accountTextField.resignFirstResponder()
//        self.passwordTextField.resignFirstResponder()
        self.view.endEditing(true)
    }

    func onButtonAction(_ sender: UIButton) {
        if let account = self.accountTextField.text, account != self.account //if let 的寫法用『,』接寫下個條件
        {
                self.statuseLabel.text = "Not found account!!"
                return
        }
        if let pass = self.passwordTextField.text, pass != self.password
        {
            self.statuseLabel.text = "Wrong password!!"
            return
        }
        self.statuseLabel.text = "You will login in 5,4,3,2,1"

}
}
