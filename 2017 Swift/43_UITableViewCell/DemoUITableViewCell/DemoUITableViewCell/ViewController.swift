//
//  ViewController.swift
//  DemoUITableViewCell
//
//  Created by smallHappy on 2017/8/25.
//  Copyright © 2017年 SmallHappy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var tableView: UITableView!
    var imageArray: [UIImage?]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.initData() //得先建構陣列
        self.initUI()
    }
    
    
    //MARK: - fcuntion
    private func initData() {
        self.imageArray = [UIImage?]() //字串有機會！所以？
        for i in 1 ... 36 {
            let image = UIImage(named: String(format: "%03d", i)) //用檔名建構陣列
            self.imageArray.append(image)
        }
    }
    
    private func initUI() {
        self.view.backgroundColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.0)
        
        self.tableView = UITableView(frame: CGRect(
            x: 10,
            y: 20,
            width: UIScreen.main.bounds.width - 20,
            height: UIScreen.main.bounds.height - 30)
        )
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.layer.cornerRadius = 8.0
        self.view.addSubview(self.tableView)
    }
    
    //MARK: - selector
    @objc fileprivate func onPreviewButtonAction(_ sender: UIButton){
        print("\(#function) - index.row = \(sender.tag)")
    }

    @objc fileprivate func onDownloadButtonAction(_ sender: UIButton){
        print("\(#function) - index.row = \(sender.tag)")
    }
    
    @objc fileprivate func onFavoriteButtonAction(_ sender: UIButton){
        print("\(#function) - index.row = \(sender.tag)")
    }
}

extension ViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300 //預設高度44
    }
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.imageArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellID = "reusableCellIdentifier"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID) as? TkTableViewCell
        if cell == nil {
            cell = TkTableViewCell(style: .default, reuseIdentifier: cellID) //重複使用cell
            cell?.selectionStyle = .none //點擊不改變顏色
        }
        cell?.titleTextView.text = "title: cell" + String(format: "%03d", indexPath.row)
        cell?._imageView.image = self.imageArray[indexPath.row]
        cell?.previewButton.tag = indexPath.row
        cell?.previewButton.addTarget(self, action: #selector(self.onPreviewButtonAction(_:)), for: .touchUpInside)
        
        cell?.downloadButton.tag = indexPath.row
        cell?.downloadButton.addTarget(self, action: #selector(self.onDownloadButtonAction(_:)), for: .touchUpInside)
            
        cell?.favoriteButton.tag = indexPath.row
        cell?.favoriteButton.addTarget(self, action: #selector(self.onFavoriteButtonAction), for: .touchUpInside)
        return cell!
    }
    
}
