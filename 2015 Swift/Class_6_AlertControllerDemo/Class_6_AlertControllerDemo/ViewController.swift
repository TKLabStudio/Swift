//
//  ViewController.swift
//  Class_6_AlertControllerDemo
//
//  Created by TK on 2015/12/1.
//  Copyright © 2015年 TK. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func point(_ sender: UIButton) {
        let myAlertController = UIAlertController(title: "Point Test", message: "POI!!", preferredStyle: UIAlertControllerStyle.actionSheet)
    }
    @IBAction func warning(_ sender: UIButton)
    {
        let myAlertController = UIAlertController(title: "Warning Test", message: "HAHA!", preferredStyle: UIAlertControllerStyle.alert)
        let callAction = UIAlertAction(title: "POI?", style: UIAlertActionStyle.default) { (callAction) -> Void in
            print("POI?")
        }
            myAlertController.addAction(callAction)

        let callAction1 = UIAlertAction(title: "POI*2?", style: UIAlertActionStyle.default) { (callAction1) -> Void in
            print("POIPOI?")
        }
            myAlertController.addAction(callAction1)
        self.present(myAlertController, animated: true, completion: nil)
        }
}

