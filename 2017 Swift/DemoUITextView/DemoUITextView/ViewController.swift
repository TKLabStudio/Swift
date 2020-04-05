//
//  ViewController.swift
//  DemoUITextView
//
//  Created by smallHappy on 2017/8/14.
//  Copyright © 2017年 SmallHappy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var previousString = ""
    var undoButton: UIButton!
    var doneButton: UIButton!
    var textView: UITextView!
    
    enum ButtonTags: Int {
        case undo = 1, done
    }
    
    var frameW: CGFloat!
    var frameH: CGFloat!
    var gap: CGFloat!
    var textY: CGFloat!
    var textW: CGFloat!
    var textH: CGFloat!
    var keyboardHeight: CGFloat = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.initUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.buttonEnable(false) //
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: .UIKeyboardWillShow, object: nil) //通知鍵盤被打開
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: .UIKeyboardWillHide, object: nil) //通知鍵盤被關閉
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self) //取消上面通知，減少記憶體的使用
    }
    
    //MARK: - fcuntion
    private func initUI() {
        self.view.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.0)
        
        self.frameW = UIScreen.main.bounds.width
        self.frameH = UIScreen.main.bounds.height
        self.gap = 10
        
        let buttonW = (self.frameW - self.gap * 3) / 2
        let buttonH: CGFloat = 30
        self.undoButton = UIButton(frame: CGRect(x: self.gap, y: 20, width: buttonW, height: buttonH))
        self.undoButton.setTitle("UNDO", for: .normal)
        self.undoButton.setTitleColor(UIColor.darkGray, for: .normal)
        self.undoButton.addTarget(self, action: #selector(self.onButtonAction(_:)), for: .touchUpInside)
        self.undoButton.tag = ButtonTags.undo.rawValue
        self.undoButton.layer.cornerRadius = 8.0
        self.undoButton.layer.borderWidth = 1.0
        self.undoButton.layer.borderColor = UIColor.darkGray.cgColor
        self.view.addSubview(self.undoButton)
        
        let undoX = self.gap + buttonW + self.gap
        self.doneButton = UIButton(frame: CGRect(x: undoX, y: 20, width: buttonW, height: buttonH))
        self.doneButton.setTitle("DONE", for: .normal)
        self.doneButton.setTitleColor(UIColor.darkGray, for: .normal)
        self.doneButton.addTarget(self, action: #selector(self.onButtonAction(_:)), for: .touchUpInside)
        self.doneButton.tag = ButtonTags.done.rawValue
        self.doneButton.layer.cornerRadius = 8.0
        self.doneButton.layer.borderWidth = 1.0
        self.doneButton.layer.borderColor = UIColor.darkGray.cgColor
        self.view.addSubview(self.doneButton)
        
        self.textY = 20 + buttonH + self.gap
        self.textW = self.frameW - gap * 2
        self.textH = frameH - textY! - gap //加！可能是nil，解決nil不能減nil的問題
        self.textView = UITextView(frame: CGRect(x: gap, y: textY, width: textW, height: textH))
        self.textView.layer.cornerRadius = 8.0
        self.textView.layer.borderWidth = 1.0
        self.textView.layer.borderColor = UIColor.darkGray.cgColor
        self.textView.textColor = UIColor.darkGray
        self.view.addSubview(textView)
        self.textView.delegate = self
        self.textView.text = """
        如果各位有在關注本網站應該會發從昨天開始就連不上了，找問題找了一天，才發現原先買的Cooler Master 酷媽GX 450W整個不讓我開機了….無奈之下拿其他的Power來支援，更無奈的事發生了…..有7顆硬碟SATA電源線卻不夠，果斷拿起之前主任給的雙Power電源線，加上大4pin轉SATA店的線兩條，伺服器火速重新上線！！
"""
    }
    
    func buttonEnable(_ enable:Bool){
        self.undoButton.isEnabled = enable //上一步的按鈕是否被觸發
    }
    
    func setUI(isKeyboardShown: Bool) {
        let offset = isKeyboardShown ? self.keyboardHeight : 0 //鍵盤有出來就是鍵盤的高度，沒出來就是0
        self.textView.frame.size.height = self.textH - offset
    }
    
    //MARK: - selector
    func onButtonAction(_ sender: UIButton) {
        guard let tag = ButtonTags(rawValue: sender.tag) else { return }
        switch tag {
        case .undo:
            self.textView.text = self.previousString //上一步
        case .done:
            self.view.endEditing(true) //End Editing
        }
    }
    
    func keyboardWillShow(notification: NSNotification) {
        if let infoKey = notification.userInfo?[UIKeyboardFrameEndUserInfoKey], let rectValue = (infoKey as AnyObject).cgRectValue {
            let keyboardFrame = self.view.convert(rectValue, to: nil)
            self.keyboardHeight = keyboardFrame.height
            self.setUI(isKeyboardShown: true)
        } //
        
    }
    
    func keyboardWillHide(notification: NSNotification) {
        self.setUI(isKeyboardShown: false)
    }

}

extension ViewController: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        self.previousString = self.textView.text //暫存輸入的文字
    }
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        print(text)
        self.previousString = self.textView.text
        self.buttonEnable(true)
        return true
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        self.buttonEnable(false)
    }
    
}
