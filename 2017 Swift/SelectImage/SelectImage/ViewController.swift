//
//  ViewController.swift
//  SelectImage
//
//  Created by smallHappy on 2017/8/10.
//  Copyright © 2017年 SmallHappy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var titleArray = ["天岩戶", "天狗", "山海幸彥", "無影女神"]
    var imageArray: [UIImage?]!
    
    var segmented: UISegmentedControl!
    var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.initData()
        self.initUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.setUI()
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

    //MARK: - function
    private func initData() {
        self.imageArray = []
        for i in 1...4{
            self.imageArray.append(UIImage(named: "book\(i)"))
        }
    }
    
    private func initUI() {
        self.segmented = UISegmentedControl(items: self.titleArray)
        self.segmented.selectedSegmentIndex = 1
        self.segmented.addTarget(self, action: #selector(self.onSegmentedAction(_:)), for: .valueChanged)
        self.view.addSubview(self.segmented)
        
        self.imageView = UIImageView()
        self.imageView.image = self.imageArray[self.segmented.selectedSegmentIndex]
        self.imageView.contentMode = .scaleAspectFill
        
        self.imageView.layer.cornerRadius = 8.0
        self.imageView.layer.borderColor = UIColor.darkGray.cgColor
        self.imageView.layer.borderWidth = 1.0
        self.imageView.clipsToBounds = true
        self.view.addSubview(self.imageView)
    }
    
    private func setUI() {
        let frameW = UIScreen.main.bounds.width
        let frameH = UIScreen.main.bounds.height
        let gap: CGFloat = 10
        
        let segmentY = gap
        let segmentW = frameW - gap * 2
        let segmentH: CGFloat = 29
        self.segmented.frame = CGRect(x: gap, y: segmentY, width: segmentW, height: segmentH)
        
        let imageY = segmentY + segmentH + gap
        let imageW = frameW - gap * 2
        let imageH = frameH - imageY - gap
        self.imageView.frame = CGRect(x: gap, y: imageY, width: imageW, height: imageH)
    }

    //MARK: - selector
    func onSegmentedAction(_ sender: UISegmentedControl) {
        self.imageView.image = self.imageArray[sender.selectedSegmentIndex]
    }
    
}

