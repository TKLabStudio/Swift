//
//  ColumnView.swift
//  CompareDate
//
//  Created by smallHappy on 2017/8/7.
//  Copyright © 2017年 SmallHappy. All rights reserved.
//

import UIKit

class ColumnView: UIView {

    var titleLabel: UILabel!
    var infoTextField: UITextField!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initUI()
    }
    
    override func layoutSubviews() {
        self.setUI()
    }
    
    //MARK: - function
    private func initUI() {
        self.titleLabel = UILabel()
        self.addSubview(self.titleLabel)
        
        self.infoTextField = UITextField()
        self.infoTextField.borderStyle = .roundedRect
        self.addSubview(self.infoTextField)
    }
    
    private func setUI() {
        let frameW = self.frame.size.width
        let frameH = self.frame.size.height
        
        let labelW: CGFloat = 75
        self.titleLabel.frame = CGRect(x: 0, y: 0, width: labelW, height: frameH)
        
        let textFieldX = labelW + 10
        let textFieldW = frameW - textFieldX
        self.infoTextField.frame = CGRect(x: textFieldX, y: 0, width: textFieldW, height: frameH)
    }

}
