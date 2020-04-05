//
//  Num3View.swift
//  Class_7_AlertController7Demo
//
//  Created by TK on 2015/12/3.
//  Copyright © 2015年 TK. All rights reserved.
//

import UIKit
protocol Xdelegate
{
    func num3func(Xcontroller:Num3View,Xtext:String)
}
class Num3View: UIViewController {
    var delegate:Xdelegate? = nil //要加？才能預設指定空值
    
    @IBOutlet weak var send2TextData: UITextField!
    @IBOutlet weak var show2TextData: UILabel!
        var num3Data:String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        show2TextData.text = num3Data
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func page2(sender: UIButton) {
        if delegate != nil
        {
            delegate?.num3func(self, Xtext: send2TextData.text!)
        }
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
