//
//  AKindVC.swift
//  PushViewController
//
//  Created by TK on 2017/12/28.
//  Copyright © 2017年 SmallHappy. All rights reserved.
//

import UIKit

class BKindVC: UIViewController {
    
    var nextButton: UIButton!
    
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
        self.view.backgroundColor = UIColor.darkGray //設定顏色使切換不卡頓
        self.title = "BKindVC" //頁面標題
        self.nextButton = UIButton()
        self.nextButton.setTitle("Next Page", for: .normal)
        self.nextButton.setTitleColor(UIColor.black, for: .normal)
        self.nextButton.addTarget(self, action: #selector(onButtonAction), for: .touchUpInside)
        self.view.addSubview(nextButton)
    }
    
    private func setUI() {
        //self.navigationController?.navigationBar.isHidden = false //不動任何bar卻還有bar驗證了navigationBar不屬於任合人的
        self.nextButton.frame = CGRect(x: 0, y: 120, width: UIScreen.main.bounds.width, height: 30)
    }
    
    //MARK: - seletor
    func onButtonAction() {
        let cVC = CKindVC()
        self.navigationController?.pushViewController(cVC, animated: true)
    }
}

