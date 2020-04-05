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
            let vc = PopVC()
            vc.modalPresentationStyle = .popover
            vc.preferredContentSize = CGSize(width: 100, height: 150)
            vc.popoverPresentationController?.permittedArrowDirections = .up
            vc.popoverPresentationController?.backgroundColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.0)
            vc.popoverPresentationController?.delegate = self
            vc.popoverPresentationController?.sourceView = self.popButton
            vc.popoverPresentationController?.sourceRect = self.popButton.bounds
            self.present(vc, animated: true, completion: {
                vc.taipeiButton.addTarget(self, action: #selector(self.onPopButtonAction(_:)), for: .touchUpInside)
                vc.taichungButton.addTarget(self, action: #selector(self.onPopButtonAction(_:)), for: .touchUpInside)
                vc.kaohsiungButton.addTarget(self, action: #selector(self.onPopButtonAction(_:)), for: .touchUpInside)
            }) //當present完成時執行completion
        }
    }
    
    func onPopButtonAction(_ sender: UIButton) {
        self.dismiss(animated: true) {
            self.label.text = sender.titleLabel?.text
        }
    }

}

extension ViewController: UIPopoverPresentationControllerDelegate {
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
}
