//
//  ViewController.swift
//  Claaa_11_AllDataDemo
//
//  Created by TK on 2015/12/27.
//  Copyright © 2015年 TK. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    struct student {
        var iid:Int32
        var cname:String
        var chinese:Int32
        var math:Int32
        init(iid:Int32,cname:String,chinese:Int32,math:Int32)
        {
            self.iid = iid
            self.cname = cname
            self.chinese = chinese
            self.math = math
        }
    }
    var allImage:Array<UIImage> = []
    var allData:Array<student> = []
    var currentStudent = 0
    var sql:NSString = ""
    var record:COpaquePointer = nil
    @IBOutlet weak var tableViewData: UITableView!
    @IBOutlet weak var textFeildMath: UITextField!
    @IBOutlet weak var textFeildName: UITextField!
    @IBOutlet weak var textFeildChinese: UITextField!
    @IBOutlet weak var insertOK: UIButton!
    @IBOutlet weak var clear: UIButton!
    var myDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    override func viewDidLoad() {
        super.viewDidLoad()
        print(NSHomeDirectory())
        clear.enabled = true
        insertOK.enabled = false
        sql = "SELECT * FROM class101" //SQL語法，撈資料庫資料
        if sqlite3_prepare_v2(myDelegate.db, sql.UTF8String, -1, &record, nil) != SQLITE_OK
        {
            callAlert("失敗", toMessage: "讀取資料庫失敗")
            exit(1) //離開程式
        }
        while sqlite3_step(record) == SQLITE_ROW
        {
            let myiid = sqlite3_column_int(record, 0) //有幾筆撈幾筆資料
            let str = sqlite3_column_text(record, 1)
            let mycname = String.fromCString(UnsafePointer<CChar>(str)) //轉碼
            let mychinese = sqlite3_column_int(record, 2)
            let mymath = sqlite3_column_int(record, 3)
            let demo:student = student(iid: myiid, cname: mycname!, chinese: mychinese, math: mymath)
            allData.append(demo)
        }
        sqlite3_finalize(record) //釋放資料庫
        tableViewData.reloadData() //更新tableView
        textFeildName.text = allData[0].cname
        textFeildChinese.text = "\(allData[0].chinese)"
        textFeildMath.text = "\(allData[0].math)"
        // Do any additional setup after loading the view, typically from a nib.
    }
    func callAlert(toTitle:String,toMessage:String)
    {
    let alertController = UIAlertController(title: toTitle, message: toMessage, preferredStyle: UIAlertControllerStyle.Alert)
    let alertOK = UIAlertAction(title: "確定", style: UIAlertActionStyle.Default, handler: { (alertOK) -> Void in
        alertController.dismissViewControllerAnimated(true, completion: nil)
        })
        alertController.addAction(alertOK)
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func modifyData(sender: UIButton) {
        let alertController = UIAlertController(title: "更新確認", message: "確定定更新資料嗎？", preferredStyle: UIAlertControllerStyle.Alert)
        let alertCancel = UIAlertAction(title: "取消", style: UIAlertActionStyle.Default, handler: { (alertCancel) -> Void in
            alertController.dismissViewControllerAnimated(true, completion: nil)})
        let alertOK = UIAlertAction(title: "確定", style: UIAlertActionStyle.Default, handler: { (alertOK) -> Void in
            self.sql = "UPDATE class101 SET s_chinese=\(self.textFeildChinese.text!),s_math=\(self.textFeildMath.text!) WHERE s_name='\(self.textFeildName.text!)'"
            })
        self.record = nil
        if sqlite3_prepare_v2(self.myDelegate.db, self.sql.UTF8String, -1, &self.record, nil) != SQLITE_OK
        {
            self.callAlert("失敗", toMessage: "讀取資料庫失敗")
            exit(1) //離開程式
        }
        if sqlite3_step(self.record) == SQLITE_DONE
        {
            self.callAlert("成功", toMessage: "資料更新成功")
        }else
        {
            self.callAlert("失敗", toMessage: "資料更新失敗")
        }
        allData[currentStudent].chinese = Int32(textFeildChinese.text!)!
        allData[currentStudent].math = Int32(textFeildMath.text!)!
        self.tableViewData.reloadData()
        }
    @IBAction func deleteData(sender: UIButton) {
        let alertController = UIAlertController(title: "刪除確認", message: "確定定刪除資料嗎？", preferredStyle: UIAlertControllerStyle.Alert)
        let alertCancel = UIAlertAction(title: "取消", style: UIAlertActionStyle.Default, handler: { (alertCancel) -> Void in
            alertController.dismissViewControllerAnimated(true, completion: nil)})
        let alertOK = UIAlertAction(title: "確定", style: UIAlertActionStyle.Default, handler: { (alertOK) -> Void in
            self.sql = "DELETE FROM class101 where s_name='\(self.textFeildName.text!)'"
            self.record = nil
            if sqlite3_prepare_v2(self.myDelegate.db, self.sql.UTF8String, -1, &self.record, nil) != SQLITE_OK
            {
                self.callAlert("失敗", toMessage: "讀取資料庫失敗")
                exit(1) //離開程式
            }
            if sqlite3_step(self.record) == SQLITE_DONE
            {
                self.callAlert("成功", toMessage: "資料刪除成功")
            }else
            {
                self.callAlert("失敗", toMessage: "資料刪除失敗")
            }
            self.allData.removeAtIndex(self.currentStudent)
            self.tableViewData.reloadData()
            if self.currentStudent == self.allData.count //當刪到最後一筆時顯示上一筆
            {
                --self.currentStudent
            }
            self.textFeildName.text = self.allData[self.currentStudent].cname
            self.textFeildChinese.text = "\(self.allData[self.currentStudent].chinese)"
            self.textFeildMath.text = "\(self.allData[self.currentStudent].math)"
            
        })
        alertController.addAction(alertCancel)
        alertController.addAction(alertOK)
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    @IBAction func clearData(sender: UIButton) {
        clear.enabled = false
        insertOK.enabled = true
        textFeildName.text = ""
        textFeildMath.text = ""
        textFeildChinese.text = ""
    }
    @IBAction func insertData(sender: UIButton) {
        clear.enabled = true
        insertOK.enabled = false
        sql = "INSERT INTO class101 (s_name,s_chinese,s_math) VALUES ('\(textFeildName.text!)',\(textFeildChinese.text!),\(textFeildMath.text!))"
        record = nil //清空描述檔
        if sqlite3_prepare_v2(myDelegate.db, sql.UTF8String, -1, &record, nil) != SQLITE_OK
        {
            callAlert("失敗", toMessage: "讀取資料庫失敗")
            exit(1) //離開程式
        }
        if sqlite3_step(record) == SQLITE_DONE
        {
            callAlert("成功", toMessage: "資料新增成功")
        }else
        {
            callAlert("失敗", toMessage: "資料新增失敗")
        }
        let myiid = Int32(sqlite3_last_insert_rowid(myDelegate.db)) //去資料庫撈row_id（內建的id）
        let mycname = textFeildName.text
        let mychinese = Int32(textFeildChinese.text!)
        let mymath = Int32(textFeildMath.text!)
        let demo:student = student.init(iid: myiid, cname: mycname!, chinese: mychinese!, math: mymath!)
        allData.append(demo)
        let img = UIImage(named: "img01.jpg")
        let data = UIImageJPEGRepresentation(img!, 1.0) //壓縮jpg檔
        let sqlimg:NSString = "INSERT INTO class101 VALUE (5,?)"
        sqlite3_prepare_v2(myDelegate.db, sqlimg.UTF8String, -1, &record,
            nil)
        sqlite3_bind_blob(record, 1, (data?.bytes)!, Int32((data?.length)!), nil)
        sqlite3_step(record)
        tableViewData.reloadData()
        textFeildName.text = allData[allData.count - 1].cname
        textFeildChinese.text = "\(allData[allData.count - 1].chinese)"
        textFeildMath.text = "\(allData[allData.count - 1].math)"
        currentStudent = allData.count - 1
        
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allData.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        cell.textLabel?.text = "姓名：\(allData[indexPath.row].cname)"
        cell.detailTextLabel?.text = "國文：\(allData[indexPath.row].chinese)  數學：\(allData[indexPath.row].math)"
        return cell
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        clear.enabled = true
        insertOK.enabled = false
        currentStudent = indexPath.row
        textFeildName.text = allData[currentStudent].cname
        textFeildChinese.text = "\(allData[currentStudent].chinese)"
        textFeildMath.text = "\(allData[currentStudent].math)"
    }
}

