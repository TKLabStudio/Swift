//
//  ViewController.swift
//  PresentViewController
//
//  Created by smallHappy on 2017/8/27.
//  Copyright © 2017年 SmallHappy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var secondButton: UIButton!
    var popButton: UIButton!
    var label: UILabel!
    
    enum SelfButtonTag: Int {
        case second = 1, pop
    }
    enum PopButtonTag: Int {
        case taipei = 1, taichung, kaohsiung
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.initUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.setUI()
    }
    
    
    //MARK: - fcuntion
    private func initUI() {
        self.secondButton = UIButton()
        self.secondButton.tag = SelfButtonTag.second.rawValue
        self.secondButton.setTitle("go to the SecondVC", for: .normal)
        self.secondButton.setTitleColor(UIColor.darkGray, for: .normal)
        self.secondButton.addTarget(self, action: #selector(self.onSelfButtonAction(_:)), for: .touchUpInside)
        self.view.addSubview(self.secondButton)
        
        self.popButton = UIButton()
        self.popButton.tag = SelfButtonTag.pop.rawValue
        self.popButton.setTitle("go to the PopVC", for: .normal)
        self.popButton.setTitleColor(UIColor.darkGray, for: .normal)
        self.popButton.addTarget(self, action: #selector(self.onSelfButtonAction(_:)), for: .touchUpInside)
        self.view.addSubview(self.popButton)
        
        self.label = UILabel()
        self.label.text = "請選擇縣市"
        self.label.textColor = UIColor.darkGray
        self.label.textAlignment = .center
        self.view.addSubview(self.label)
    }
    
    private func setUI() {
        let frameW = UIScreen.main.bounds.width
//        let frameH = UIScreen.main.bounds.height
//        let gap: CGFloat = 10
        
        self.secondButton.frame = CGRect(x: 0, y: 120, width: frameW, height: 30)
        self.popButton.frame = CGRect(x: 0, y: 160, width: frameW, height: 30)
        self.label.frame = CGRect(x: 0, y: 350, width: frameW, height: 21)
    }
    
    //MARK: - selector
    func onSelfButtonAction(_ sender: UIButton) {
        guard let tag = SelfButtonTag(rawValue: sender.tag) else { return }
        switch tag {
        case .second:
            let vc = SecondVC()
            self.present(vc, animated: true, completion: nil)
        case .pop:
            break
        }
    }
    
    func onPopButtonAction(_ sender: UIButton) {
        self.dismiss(animated: true) {
            guard let tag = PopButtonTag(rawValue: sender.tag) else { return }
            switch tag {
            case .taipei:
                self.label.text = sender.titleLabel?.text
            case .taichung:
                self.label.text = sender.titleLabel?.text
            case .kaohsiung:
                self.label.text = sender.titleLabel?.text
            }
        }
    }

}

//TODO: - 待完成
