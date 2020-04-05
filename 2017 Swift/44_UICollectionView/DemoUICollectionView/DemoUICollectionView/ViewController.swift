//
//  ViewController.swift
//  DemoUICollectionView
//
//  Created by smallHappy on 2017/8/27.
//  Copyright © 2017年 SmallHappy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var imageArray: [UIImage?]!
    let cellID = "displayID"
    
    var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        initData()
        initUI()
    }
    
    //MARK: - fcuntion
    private func initData() {
        self.imageArray = [UIImage?]()
        for i in 1 ... 36 {
            let image = UIImage(named: String(format: "%03d", i))
            self.imageArray.append(image)
        }
    }
    
    private func initUI() {
        self.view.backgroundColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.0)
        
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: (UIScreen.main.bounds.width - 20) / 2 - 5, height: (UIScreen.main.bounds.width - 20) / 2 - 5)
        self.collectionView = UICollectionView(frame: CGRect(x: 10, y: 20, width: UIScreen.main.bounds.width - 20, height: UIScreen.main.bounds.height - 30), collectionViewLayout: layout)
        self.collectionView.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: self.cellID) //註冊class（重要）
        self.collectionView.backgroundColor = UIColor.clear
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.view.addSubview(self.collectionView)
    }
    
    //MARK: - selector
    func onPreviewButtonAction(_ sender: UIButton) {
        print("\(#function) - indexPath.row = \(sender.tag)")
    }
    
    func onDownloadButton(_ sender: UIButton) {
        print("\(#function) - indexPath.row = \(sender.tag)")
    }
    
    func onFavoriteButton(_ sender: UIButton) {
        print("\(#function) - indexPath.row = \(sender.tag)")
    }

}

extension ViewController: UICollectionViewDelegate {
    
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cellID, for: indexPath) as! MyCollectionViewCell
        cell.layer.cornerRadius = 8.0
        cell.titleTextView.text = "title: cell" + String(format: "%03d", indexPath.row)
        cell._imageView.image = self.imageArray[indexPath.row]
        cell.previewButton.tag = indexPath.row
        cell.previewButton.addTarget(self, action: #selector(self.onPreviewButtonAction(_:)), for: .touchUpInside)
        cell.downloadButton.tag = indexPath.row
        cell.downloadButton.addTarget(self, action: #selector(self.onDownloadButton(_:)), for: .touchUpInside)
        cell.favoriteButton.tag = indexPath.row
        cell.favoriteButton.addTarget(self, action: #selector(self.onFavoriteButton(_:)), for: .touchUpInside)
        return cell
    }
    
}
