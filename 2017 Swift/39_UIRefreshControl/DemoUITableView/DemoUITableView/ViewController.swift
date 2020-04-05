//
//  ViewController.swift
//  DemoUITableView
//
//  Created by smallHappy on 2017/8/18.
//  Copyright © 2017年 SmallHappy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var model = TvModel()
    let cellID = "DisplayCellID"
    let headerH: CGFloat = 31
    
    var tableView: UITableView!
    var loadingAnimatingView: LoadingAnimatingView!
    
    var refreshControl: UIRefreshControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.initUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.setUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.initData()
    }
    
    
    //MARK: - fcuntion
    private func initData() {
        
        if self.loadingAnimatingView.activityIndicatorView.isAnimating{ return }
        
        let dispatchGroup = DispatchGroup()
        dispatchGroup.enter()
        DispatchQueue.global(qos: .userInitiated).async(group: dispatchGroup) {
            if let url = URL(string: "http://www.smallyen.com/smallhappy/json.php?tv=program") {
                JsonManager.shareInstance.getJsonObject(method: .get, url: url) { (object) in
                    print("program下載完成")
                    self.model.setProgramData(jsonObject: object)
                    dispatchGroup.leave()
                }
            }
        }
        dispatchGroup.enter()
        DispatchQueue.global(qos: .userInitiated).async(group: dispatchGroup) {
            if let url = URL(string: "http://www.smallyen.com/smallhappy/json.php?tv=news") {
                JsonManager.shareInstance.getJsonObject(method: .get, url: url) { (object) in
                    print("news下載完成")
                    self.model.setNewsData(jsonObject: object)
                    dispatchGroup.leave()
                }
            }
        }
        dispatchGroup.enter()
        DispatchQueue.global(qos: .userInitiated).async(group: dispatchGroup) {
            if let url = URL(string: "http://www.smallyen.com/smallhappy/json.php?tv=sports") {
                JsonManager.shareInstance.getJsonObject(method: .get, url: url) { (object) in
                    print("sports下載完成")
                    self.model.setSportsData(jsonObject: object)
                    dispatchGroup.leave()
                }
            }
        }
        dispatchGroup.enter()
        DispatchQueue.global(qos: .userInitiated).async(group: dispatchGroup) {
            if let url = URL(string: "http://www.smallyen.com/smallhappy/json.php?tv=recreations") {
                JsonManager.shareInstance.getJsonObject(method: .get, url: url) { (object) in
                    print("recreations下載完成")
                    self.model.setRecreationsData(jsonObject: object)
                    dispatchGroup.leave()
                }
            }
        }
        dispatchGroup.notify(queue: DispatchQueue.global(qos: .userInitiated)) {
            print("下載完成")
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.loadingAnimatingView.stop()
                self.refreshControl.endRefreshing() //結束refreshControl
            }
        }
        
    }
    
    private func initUI() {
        self.tableView = UITableView()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.layer.cornerRadius = 8
        self.tableView.sectionIndexBackgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.8)
        self.tableView.sectionIndexColor = UIColor.white
        self.view.addSubview(self.tableView)
        
        self.loadingAnimatingView = LoadingAnimatingView()
        self.view.addSubview(self.loadingAnimatingView)
        
        self.refreshControl = UIRefreshControl()
        self.refreshControl.addTarget(self, action: #selector(onRefreshControlAction), for: .valueChanged)  //新增目標
        self.refreshControl.attributedTitle = NSAttributedString(string: "Now loading!") //新增文字在動畫下方
        self.tableView.addSubview(refreshControl) //加在tableView身上
        
    }
    
    private func setUI() {
        let frameW = UIScreen.main.bounds.width
        let frameH = UIScreen.main.bounds.height
        let gap: CGFloat = 10
        
        self.tableView.frame = CGRect(x: gap, y: 20, width: frameW - gap * 2, height: frameH - 20 - gap)
    }

    //MARK: - selector
    @objc func onRefreshControlAction(){ //給RefreshControl用的方法
        self.initData()
    }
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deleteRows(at: [indexPath], with: .fade)
    }
    
}

extension ViewController: UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.model.program.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return self.model.news.count
        case 1:
            return self.model.sports.count
        case 2:
            return self.model.recreations.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: self.headerH))
        headerView.backgroundColor = UIColor(red: 136 / 255, green: 176 / 255, blue: 75 / 255, alpha: 1.0)
        
        let labelH: CGFloat = 21
        let space = (self.headerH - labelH) / 2
        let label = UILabel(frame: CGRect(x: space, y: space, width: tableView.bounds.width - space * 2, height: labelH))
        label.text = self.model.program[section]
        headerView.addSubview(label)
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return self.headerH
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: self.cellID)
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: self.cellID)
            cell!.selectionStyle = .none
        }
        
        switch indexPath.section {
        case 0:
            cell!.textLabel!.text = self.model.news[indexPath.row]
        case 1:
            cell!.textLabel!.text = self.model.sports[indexPath.row]
        case 2:
            cell!.textLabel!.text = self.model.recreations[indexPath.row]
        default:
            cell!.textLabel!.text = ""
        }
        
        return cell!
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return self.model.program
    }
    
}
