//
//  Num2View.swift
//  Class_7_AlertController7Demo
//
//  Created by TK on 2015/12/2.
//  Copyright © 2015年 TK. All rights reserved.
//

import UIKit

class Num2View: UIViewController,Xdelegate {
    
    @IBOutlet weak var show3TextData: UILabel!
    @IBOutlet weak var sendTextData: UITextField!
    var myUser:String = ""
    var myPass:String = ""

    @IBOutlet weak var password: UILabel!
    @IBOutlet weak var username: UILabel!
    override func viewDidLoad() {

        super.viewDidLoad()
        username.text = myUser
        password.text = myPass
        // Do any additional setup after loading the view.
    }

    func userData(n1:String,p1:String)
    {
        myUser = n1
        myPass = p1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func num3func(Xcontroller: Num3View, Xtext: String) {
        self.show3TextData.text = Xtext
    }

    @IBAction func page1(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) { //各個View傳資料的方法
        if segue.identifier == "Xtest"
        {
            let VC3:Num3View = segue.destinationViewController as! Num3View //destination就是這個連結的目的是...
         //   VC3.show2TextData.text = sendTextData.text //outlet只能在自己View的環境下運作
            VC3.num3Data = sendTextData.text! //多var一個num3Data來傳值 ！用來解除閉包
            VC3.delegate = self //把方法加進來
        }
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
