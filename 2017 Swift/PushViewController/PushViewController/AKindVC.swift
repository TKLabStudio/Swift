//
//  AKindVC.swift
//  PushViewController
//
//  Created by TK on 2017/12/28.
//  Copyright © 2017年 SmallHappy. All rights reserved.
//

import UIKit

class AKindVC: UIViewController {

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
        self.view.backgroundColor = UIColor.white //設定顏色使切換不卡頓
        self.title = "AKindVC" //頁面標題
        self.nextButton = UIButton()
        self.nextButton.setTitle("Next Page", for: .normal)
        self.nextButton.setTitleColor(UIColor.darkGray, for: .normal)
        self.nextButton.addTarget(self, action: #selector(onButtonAction), for: .touchUpInside)
        self.view.addSubview(nextButton)
    }
    
    private func setUI() {
        self.navigationController?.navigationBar.isHidden = false //顯示上方的Bar，去『我』裡面尋找自己隸屬哪個navigationController，「?」避免找不到自己是哪個類別而導致是nil，不能寫在viewDidLoad裡，不然會抓不到自己是哪個類別
        self.nextButton.frame = CGRect(x: 0, y: 120, width: UIScreen.main.bounds.width, height: 30)
    }
    
    //MARK: - seletor
    func onButtonAction() {
        let bVC = BKindVC()
        self.navigationController?.pushViewController(bVC, animated: true)
    }
}
