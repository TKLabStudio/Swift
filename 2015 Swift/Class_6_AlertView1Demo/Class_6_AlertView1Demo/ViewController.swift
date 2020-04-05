//
//  ViewController.swift
//  Class_6_AlertView1Demo
//
//  Created by TK on 2015/11/30.
//  Copyright © 2015年 TK. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIAlertViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
//        let alert = UIAlertView(title: "Title Test", message: "Your Computer is Hack by TK", delegate: nil, cancelButtonTitle: "1", otherButtonTitles: "2","3","4","5")
//        alert.show()
        let alert = UIAlertView()
        alert.title = "報價單"
        alert.message = "請點選槍枝顯示售價"
        alert.delegate = self
        alert.addButton(withTitle: "M4A1")
        alert.addButton(withTitle: "AK47")
        alert.addButton(withTitle: "TMP")
        alert.addButton(withTitle: "M82")
        alert.show()

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func alertView(_ alertView: UIAlertView, clickedButtonAt buttonIndex: Int) {
        let string = alertView.buttonTitle(at: buttonIndex)
    }
//
//    @IBAction func none(sender: UIButton) {
//        let alert = UIAlertView()
//        alert.title = "NO Button"
//        alert.message = "0"
//        alert.delegate = nil
//        alert.show()
//    }
//    @IBAction func one(sender: UIButton) {
//        let alert = UIAlertView()
//        alert.title = "ONE Button"
//        alert.message = "1"
//        alert.delegate = nil
//        alert.addButtonWithTitle("Cancel")
//        alert.show()
//    }
//    @IBAction func two(sender: UIButton) {
//        let alert = UIAlertView()
//        alert.title = "TWO Button"
//        alert.message = "2"
//        alert.delegate = nil
//        alert.addButtonWithTitle("1")
//        alert.addButtonWithTitle("2")
//        alert.show()
//    }
//    @IBAction func three(sender: UIButton) {
//        let alert = UIAlertView()
//        alert.title = "THREE Button"
//        alert.message = "3"
//        alert.delegate = nil
//        alert.addButtonWithTitle("1")
//        alert.addButtonWithTitle("2")
//        alert.addButtonWithTitle("3")
//
//        alert.show()
//    }
}

