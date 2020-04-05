//
//  SecondVC.swift
//  PresentViewController
//
//  Created by TK on 2017/12/26.
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
    
    //MARK: - function
    private func initUI() {
        backButton = UIButton()
        backButton.setTitle("back to the ViewCotroller", for: .normal)
        backButton.setTitleColor(UIColor.lightGray, for: .normal)
        backButton.addTarget(self, action: #selector(self.onButtonAction), for: .touchUpInside)
        self.view.addSubview(backButton)
    }
    
    private func setUI() {
        let frameW = self.view.frame.width
        self.backButton.frame = CGRect(x: 0, y: 120, width: frameW, height: 30)
    }
    
    // MARK: - selector
    @objc func onButtonAction() {
        self.dismiss(animated: true, completion: nil)
    }

}
