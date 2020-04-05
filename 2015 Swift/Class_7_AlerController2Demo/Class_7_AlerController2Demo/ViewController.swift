//
//  ViewController.swift
//  Class_7_AlerController2Demo
//
//  Created by TK on 2015/12/1.
//  Copyright © 2015年 TK. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
               // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidLoad()
        let alertVC = UIAlertController(title: "設定", message: "System Config", preferredStyle: UIAlertControllerStyle.ActionSheet)
        let set1 = UIAlertAction(title: "Audio", style: UIAlertActionStyle.Default) { (set1) -> Void in
            
        }
        let set2 = UIAlertAction(title: "解析度", style: UIAlertActionStyle.Destructive) { (set2) -> Void in //Destructive為警告訊息
            
        }
        let set3 = UIAlertAction(title: "亮度", style: UIAlertActionStyle.Default) { (set3) -> Void in
            
        }
        alertVC.addAction(set1)
        alertVC.addAction(set2)
        alertVC.addAction(set3)
        self.presentViewController(alertVC, animated: true, completion: nil)

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

