//
//  ViewController.swift
//  DemoAttributedString
//
//  Created by smallHappy on 2017/12/13.
//  Copyright © 2017年 SmallHappy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var label1: UILabel!
    var label2: UILabel!
    var label3: UILabel!
    var label4: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print(self.view.frame.size)
        self.setLabel1()
        self.setLabel2()
        self.setLabel3()
        self.setLabel4()
    }

    func setLabel1() {
        self.label1 = UILabel()
        self.label1.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.0)
        self.label1.frame = CGRect(x: 0, y: 20, width: 200, height: 200)
        self.view.addSubview(self.label1)
        
        let infomation = "天地有正氣，雜然賦流形。下則為河嶽，上則為日星。"
        let attributeString = NSMutableAttributedString(string: infomation) //建構帶有屬性的字串infomation
        //上標
        attributeString.addAttribute(kCTSuperscriptAttributeName as NSAttributedStringKey, value: 1, range: NSMakeRange(2, 2)) //舊寫法
        //下標
        attributeString.addAttribute(kCTSuperscriptAttributeName as NSAttributedStringKey, value: -1, range: NSRange(location: 8, length: 3)) //NSRange新寫法
        //字體
        let font = UIFont(name: "Avenir-Light", size: 24) ?? UIFont.systemFont(ofSize: 24)
        attributeString.addAttribute(NSAttributedStringKey.font, value: font, range: NSRange(location: 12, length: 6))
        
        //顏色
        let color = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        attributeString.addAttribute(NSAttributedStringKey.foregroundColor, value: color, range: NSRange(location: 12, length: 2))
        
        self.label1.attributedText = attributeString
        self.label1.sizeToFit() //自動符合寬高
        print(self.label1.frame.size)
    }
    
    func setLabel2() {
        self.label2 = UILabel()
        self.label2.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.0)
        self.label2.frame.origin = CGPoint(x: 10, y: self.label1.frame.maxY + 10)
        self.label2.numberOfLines = 0
        self.view.addSubview(self.label2)
        
        let infomation = "於人曰浩然，沛乎塞蒼冥。\n皇路當清夷，含和吐明庭。\n時窮節乃見，一一垂丹青。\n在齊太史簡，在晉董狐筆。"
        let attributeString = NSMutableAttributedString(string: infomation)
        
        //字距
        let spacing: CGFloat = 15.0
        attributeString.addAttribute(NSAttributedStringKey.kern, value: spacing, range: NSRange(location: 0, length: infomation.count))
        //行距
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 40
       attributeString.addAttribute(NSAttributedStringKey.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: infomation.count))
        
        
        self.label2.attributedText = attributeString
        self.label2.sizeToFit()
        print(self.label2.frame.size)
    }
    
    func setLabel3() {
        self.label3 = UILabel()
        self.label3.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.0)
        self.label3.frame.origin = CGPoint(x: 10, y: self.label2.frame.maxY + 10)
        self.label3.numberOfLines = 0
        self.view.addSubview(self.label3)
        
        let infomation = "6.022*1023"
        
        let font_base = UIFont.systemFont(ofSize: 20)
        let font_super = UIFont.systemFont(ofSize: 10)
        
        let attributeString = NSMutableAttributedString(string: infomation, attributes: [.font: font_base])
        self.label3.attributedText = attributeString
        //上標
        attributeString.addAttributes([
            .font: font_super,
            NSAttributedStringKey.baselineOffset: 10
            ], range: NSRange(location: 8, length: 2))
        
        self.label3.attributedText = attributeString
        self.label3.sizeToFit()
        print(self.label3.frame.size)
        
    }
    
    func setLabel4() {
        self.label4 = UILabel()
        self.label4.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.0)
        self.label4.frame.origin = CGPoint(x: 10, y: self.label3.frame.maxY + 10)
        self.label4.numberOfLines = 0
        self.view.addSubview(self.label4)
        
        guard let url = Bundle.main.url(forResource: "content", withExtension: "html") else { return }
        guard let data = try? Data(contentsOf: url) else { return }
        guard let attributeString = try? NSAttributedString(data: data, options: [NSAttributedString.DocumentReadingOptionKey.documentType : NSAttributedString.DocumentType.html], documentAttributes: nil) else { return }
        self.label4.attributedText = attributeString
        self.label4.sizeToFit()
        print(self.label4.frame.size)
    }

}
