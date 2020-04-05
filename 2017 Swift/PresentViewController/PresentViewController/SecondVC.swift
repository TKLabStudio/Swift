//
//  SecondVC.swift
//  PresentViewController
//
//  Created by XCODE on 2017/12/26.
//  Copyright © 2017年 SmallHappy. All rights reserved.
//

import UIKit

class SecondVC: UIViewController {

    var backButton: UIButton!
    
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
        self.view.backgroundColor = UIColor.black
        self.backButton = UIButton()
        self.backButton.setTitle("back to the ViewController", for: .normal)
        self.backButton.setTitleColor(UIColor.lightGray, for: .normal)
        self.backButton.addTarget(self, action: #selector(self.onButtonAction), for: .touchUpInside)
        self.view.addSubview(self.backButton)
    }
    
    private func setUI() {
        let frameW = self.view.frame.width
        self.backButton.frame = CGRect(x: 0, y: 120, width: frameW, height: 30)
    }
    
    // MARK: - selector
    @objc private func onButtonAction() {
        self.dismiss(animated: true, completion: nil)
    }

}









