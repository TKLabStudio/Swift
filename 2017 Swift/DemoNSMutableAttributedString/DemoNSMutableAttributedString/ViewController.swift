//
//  ViewController.swift
//  DemoNSMutableAttributedString
//
//  Created by smallHappy on 2017/12/8.
//  Copyright © 2017年 SmallHappy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.initUI()
        
        self.setAnimal()
        
    }
    
    func initUI() {
        
        self.view.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.0)
        
        self.textView = UITextView(frame: CGRect(x: 10, y: 20, width: self.view.frame.width - 20, height: 200))
        self.textView.isEditable = false
        self.textView.isSelectable = false
        self.view.addSubview(self.textView)
        
    }
    
    func setAnimal() {
        
        // section1
        let attributedString = NSMutableAttributedString(string: "關於我\n")
        attributedString.addAttributes([
            NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1),
            .font: UIFont.systemFont(ofSize: 24)
            ], range: NSRange(location: 0, length: attributedString.length))
        
        
        
        let attr = NSMutableAttributedString(string: category + "\n")
        attr.addAttributes([
            NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1),
            .font: UIFont.systemFont(ofSize: 16)
            ], range: NSRange(location: 0, length: attr.length))
        
        attributedString.append(attr) //寫另一個attributedString並加進去

        // section2
        attributedString.append("經歷\n".topic)
        attributedString.append((distribution + "\n").content)
        
        // section3
        attributedString.append("聯絡我\n".topic)
        attributedString.append((feature + "\n").content)
        
        self.textView.attributedText = attributedString

    }
    
}

extension String {
    
    var topic: NSMutableAttributedString{
        let returnAttributedString = NSMutableAttributedString(string: self)
        returnAttributedString.addAttributes([
            NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1),
            .font: UIFont.systemFont(ofSize: 24)
            ], range: NSRange(location: 0, length: returnAttributedString.length))
     return returnAttributedString
    }
    
    var content: NSMutableAttributedString{
        let returnAttributedString = NSMutableAttributedString(string: self)
        returnAttributedString.addAttributes([
            NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1),
            .font: UIFont.systemFont(ofSize: 16)
            ], range: NSRange(location: 0, length: self.count))
        return returnAttributedString
    }
    
}
