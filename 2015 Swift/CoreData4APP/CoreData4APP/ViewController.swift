//
//  ViewController.swift
//  CoreData4APP
//
//  Created by TK on 2016/9/20.
//  Copyright © 2016年 TK. All rights reserved.
//

import UIKit
import CoreData //NSManagedObjectContext需要

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var result:[UserData] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let AppDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context:NSManagedObjectContext = AppDel.managedObjectContext
        let fetch:NSFetchRequest = NSFetchRequest(entityName: "UserData") //撈資料
        do { try result = context.executeFetchRequest(fetch) as! [UserData]}catch let error{print(error)}
        initData()
        myTableView.reloadData()
    }
    @IBOutlet weak var myTableView: UITableView!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

func initData()
{
    if result.count == 0
    {
        let AppDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context:NSManagedObjectContext = AppDel.managedObjectContext
//        let fetch:NSFetchRequest = NSFetchRequest(entityName: "UserData") //撈資料
        var user:UserData
        user = NSEntityDescription.insertNewObjectForEntityForName("UserData", inManagedObjectContext: context) as! UserData //工厂方法，根据给定的 Entity 描述，生成相应的 NSManagedObject 对象，并插入到 ManagedObjectContext 中
        user.iid = "TK"
        user.cname = "T01"
        AppDel.saveContext() //存資料進資料庫
        
        user = NSEntityDescription.insertNewObjectForEntityForName("UserData", inManagedObjectContext: context) as! UserData
        user.iid = "Jacky"
        user.cname = "T02"
        AppDel.saveContext() //存資料進資料庫
    }
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return result.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell",forIndexPath: indexPath)
        cell.textLabel?.text = "編號：\(result[indexPath.row].iid!) 姓名：\(result[indexPath.row].cname!)"
        return cell
    }
    @IBAction func addClick(sender: UIButton) {
    }
}
extension UserData
{
    func addCarObject(value:Car)
    {
    let items = self.mutableSetValueForKey("udcar")
        items.addObject(value)
    }
}

