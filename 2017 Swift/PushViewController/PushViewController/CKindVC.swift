//
//  CKindVC.swift
//  PushViewController
//
//  Created by TK on 2017/12/28.
//  Copyright © 2017年 SmallHappy. All rights reserved.
//

import UIKit

class CKindVC: UIViewController {
    
    var backButton: UIButton!
    var jumpButton: UIButton!
    var rootButton: UIButton!
    var aVC: AKindVC!
    
    enum ButtonTag: Int{
        case back = 1, jump, root
    }

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
        self.view.backgroundColor = UIColor.white
        self.title = "CKindVC"
        
        func getButton(title: String, tag: ButtonTag) -> UIButton
        {
            let button = UIButton()
            button.tag = tag.rawValue
            button.setTitle(title, for: .normal)
            button.setTitleColor(UIColor.darkGray, for: .normal)
            button.addTarget(self, action: #selector(onButtonAction(_:)), for: .touchUpInside)
            return button
        }
        self.backButton = getButton(title: "Back to last page", tag: .back)
        self.view.addSubview(backButton)
        self.jumpButton = getButton(title: "Jump to aVC", tag: .jump)
        self.view.addSubview(jumpButton)
        self.rootButton = getButton(title: "Back to root page", tag: .root)
        self.view.addSubview(rootButton)
    }
    
    private func setUI() {
        //self.navigationController?.navigationBar.isHidden = false

        let frameW = UIScreen.main.bounds.width
        self.backButton.frame = CGRect(x: 0, y: 120, width: frameW, height: 30)
        self.jumpButton.frame = CGRect(x: 0, y: 160, width: frameW, height: 30)
        self.rootButton.frame = CGRect(x: 0, y: 200, width: frameW, height: 30)
    }
    
    //MARK: - selector
    func onButtonAction(_ sender: UIButton) {
        guard let tag = ButtonTag(rawValue: sender.tag) else {return}
            switch tag{
            case .back:
                self.navigationController?.popViewController(animated: true)
            case .jump:
              self.aVC = AKindVC()
                self.navigationController?.pushViewController(aVC, animated: true)
            case .root:
                self.navigationController?.popToRootViewController(animated: true)
        }
    }
}
