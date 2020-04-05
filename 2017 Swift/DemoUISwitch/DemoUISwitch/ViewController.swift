//
//  ViewController.swift
//  DemoUISwitch
//
//  Created by TK on 2017/11/27.
//  Copyright © 2017年 TK. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var _switch:UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()
        _switch = UISwitch()
        self._switch.isOn = true
        self._switch.addTarget(self, action: #selector(self.onSwitchAction(_:)), for: .valueChanged)
        self.view.addSubview(_switch)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        self._switch.frame.origin = CGPoint(x: 60, y: 60)
//        self._switch.frame.size = CGSize(width: <#T##CGFloat#>, height: <#T##CGFloat#>)
        self._switch.center = self.view.center
    }
    
    @objc func onSwitchAction(_ sender: UISwitch){
        print(sender.isOn)
    }

}

