//
//  ViewController.swift
//  PushViewController
//
//  Created by smallHappy on 2017/8/27.
//  Copyright © 2017年 SmallHappy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var cellID = "displayID"
    var array: [(title: String, color: UIColor?)]!
    
    var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.initData()
        self.initUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.setUI()
    }
    
    
    //MARK: - fcuntion
    private func initData() {
        self.array = [
            ("subVC", nil),
            ("black", UIColor.black),
            ("darkGray", UIColor.darkGray),
            ("lightGray", UIColor.lightGray),
            ("white", UIColor.white),
            ("gray", UIColor.gray),
            ("red", UIColor.red),
            ("green", UIColor.green),
            ("blue", UIColor.blue),
            ("cyan", UIColor.cyan),
            ("yellow", UIColor.yellow),
            ("magenta", UIColor.magenta),
            ("orange", UIColor.orange),
            ("purple", UIColor.purple),
            ("brown", UIColor.brown)
        ]
    }
    
    private func initUI() {
        self.view.addSubview(UIView(frame: CGRect.zero))
        
        self.tableView = UITableView()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.separatorColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1) //線的顏色
        self.tableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0) //把線補滿
        self.tableView.tableFooterView = UIView() //隱藏多餘的線（利用建構一個空的UIVIew，寬高都為0所以不會出現線）
        
        self.view.addSubview(self.tableView)
    }
    
    private func setUI() {
        let frameW = UIScreen.main.bounds.width
        let frameH = UIScreen.main.bounds.height
//        let gap: CGFloat = 10
        
        self.navigationController?.navigationBar.isHidden = true //隱藏上方的Bar，去『我』裡面尋找自己隸屬哪個navigationController
        
        self.tableView.frame = CGRect(x: 10, y: 20, width: frameW - 20, height: frameH - 30)
    }

}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let color = self.array[indexPath.row].color {
            //TODO: - 待完成
        } else {
            let aVC = AKindVC()
            self.navigationController?.pushViewController(aVC, animated: true) //用push來切換畫面
        }
    }
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: self.cellID)
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: self.cellID)
        }
        cell?.textLabel?.text = self.array[indexPath.row].title
        cell?.alpha = 0.4
        return cell!
    }
    
}
