//
//  PopVC.swift
//  PresentViewController
//
//  Created by XCODE on 2017/12/26.
//  Copyright © 2017年 SmallHappy. All rights reserved.
//

import UIKit

class PopVC: UIViewController {
    
    var taipeiButton: UIButton!
    var taichungButton: UIButton!
    var kaohsiungButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.initUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.setUI()
    }
    
    // MARK: - function
    private func initUI() {
        func getButton(title: String) -> UIButton {
            let button = UIButton()
            button.setTitle(title, for: .normal)
            button.setTitleColor(UIColor.darkGray, for: .normal)
            button.layer.cornerRadius = 8.0
            button.layer.borderWidth = 1.0
            button.layer.borderColor = UIColor.darkGray.cgColor
            return button
        }
        self.taipeiButton = getButton(title: "台北")
        self.view.addSubview(self.taipeiButton)
        self.taichungButton = getButton(title: "台中")
        self.view.addSubview(self.taichungButton)
        self.kaohsiungButton = getButton(title: "高雄")
        self.view.addSubview(self.kaohsiungButton)
    }
    
    private func setUI() {
        let frameW = self.view.frame.width
        let frameH = self.view.frame.height
        let gap: CGFloat = 10
        
        let buttonW = frameW - gap * 2
        let buttonH = (frameH - gap * 4) / 3
        self.taipeiButton.frame = CGRect(x: gap, y: gap, width: buttonW, height: buttonH)
        self.taichungButton.frame = CGRect(x: gap, y: self.taipeiButton.frame.maxY + gap, width: buttonW, height: buttonH)
        self.kaohsiungButton.frame = CGRect(x: gap, y: self.taichungButton.frame.maxY + gap, width: buttonW, height: buttonH)
    }

}









