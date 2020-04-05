//
//  MasterViewController.swift
//  Class_8_MasterDetaillDemo
//
//  Created by TK on 2016/1/24.
//  Copyright © 2016年 TK. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    @IBOutlet weak var textViewContent: UITextView!
    @IBOutlet weak var textFieldName: UITextField!
    var detailViewController: DetailViewController? = nil
    var objects = [AnyObject]()


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.leftBarButtonItem = self.editButtonItem()

        let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "insertNewObject:")
        self.navigationItem.rightBarButtonItem = addButton
        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
    }

    override func viewWillAppear(animated: Bool) {
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.collapsed
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func insertNewObject(sender: AnyObject) {
        if textFieldName.text != "" && textViewContent.text != ""
        {
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle //日期格式
            dateFormatter.timeStyle = NSDateFormatterStyle.MediumStyle //時間格式
            let currentTime = dateFormatter.stringFromDate(NSDate()) //抓現在格式
            let dic:Dictionary<String,String> = ["name":textFieldName.text!,"date":currentTime,"content":textViewContent.text]
            objects.insert(dic, atIndex: 0) //回傳dic
            let indexPath = NSIndexPath(forRow: 0, inSection: 0)
            self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
            textFieldName.text = "" //最後全部清空
            textViewContent.text = ""
        }else //做輸入錯誤的判斷
        {
            let alartVC = UIAlertController(title: "錯誤！", message: "請填寫名稱或內容！", preferredStyle: UIAlertControllerStyle.Alert)
            let set1 = UIAlertAction(title: "確認", style: UIAlertActionStyle.Default, handler: { (set1) -> Void in
                alartVC.dismissViewControllerAnimated(true, completion: nil)
            })
            alartVC.addAction(set1)
            self.presentViewController(alartVC, animated: true, completion: nil)
            
        }
    }

    // MARK: - Segues

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let object = objects[indexPath.row] as! Dictionary<String,String> //改成傳兩個輸入的值
                let controller = segue.destinationViewController as! DetailViewController
                controller.detailItem = object
//                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
//                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    // MARK: - Table View

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)

        let object = objects[indexPath.row] as! Dictionary<String,String>
        cell.textLabel!.text = object["name"]
        return cell
    }

    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            objects.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }


}

