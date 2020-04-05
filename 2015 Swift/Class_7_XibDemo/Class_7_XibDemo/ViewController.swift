//
//  ViewController.swift
//  Class_7_XibDemo
//
//  Created by TK on 2015/12/12.
//  Copyright © 2015年 TK. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func toSecond(sender: UIButton) {
        let VC2 = XibViewController()
        self.presentViewController(VC2, animated: true, completion: nil) //從外部載入進來（限定一個View）
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

