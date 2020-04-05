//
//  ViewController.swift
//  Class_9_NotePadDemo
//
//  Created by TK on 2015/12/13.
//  Copyright © 2015年 TK. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    var fm = NSFileManager()
    var homepath = NSHomeDirectory() + "/Documents/"
    var aryList:Array<NSString> = []
    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var tableViewContent: UITableView!
    @IBOutlet weak var textViewContent: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        aryList.removeAll(keepCapacity: true) //清空陣列裡所有東西
        aryList = fm.subpathsAtPath(homepath)! //撈Documents裡的資料         
        for file in aryList
        {
            if file.substringWithRange(NSRange(location: file.length - 4, length: 4)) == ".txt" //location從什麼地方開始 判斷副檔名是否為.txt
            {
                aryList.append(file) //如果是，新增資料上file
            }
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func saveCilck(sender: UIButton) {
        if textFieldName.text == "" || textViewContent.text == ""
        {
            let alertController = UIAlertController(title: "錯誤！", message: "請輸入內容！！", preferredStyle: UIAlertControllerStyle.Alert)
            let alertOK = UIAlertAction(title: "確定", style: UIAlertActionStyle.Default, handler:
                { (alertOK) -> Void in
                    alertController.dismissViewControllerAnimated(true, completion: nil)
            })
            alertController.addAction(alertOK)
            self.presentViewController(alertController, animated: true, completion: nil)
        }else
        {
            if textFieldName.text?.hasSuffix(".txt") == false //後綽字判斷是否有副檔名
            {
                textFieldName.text = textFieldName.text! + ".txt"
            }
            let path = homepath + textFieldName.text!
            try!textViewContent.text.writeToFile(path, atomically: true, encoding: NSUTF8StringEncoding)
            if aryList.indexOf(textFieldName.text!) == nil //indexOf為給資料傳索引值
            {
                aryList.append(textFieldName.text!)
            }
        }
        tableViewContent.reloadData() //更新表單
    }
    @IBAction func delCilck(sender: UIButton) {
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return aryList.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let mycell = tableViewContent.dequeueReusableCellWithIdentifier("cell")
        mycell?.textLabel?.text = mycell[indexPath.row]
    }
}

