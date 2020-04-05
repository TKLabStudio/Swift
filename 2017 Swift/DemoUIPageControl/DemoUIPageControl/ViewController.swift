//
//  ViewController.swift
//  DemoUIPageControl
//
//  Created by smallHappy on 2017/8/14.
//  Copyright © 2017年 SmallHappy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var imageView: UIImageView!
    var pageControl: UIPageControl!
    var imageArray = [#imageLiteral(resourceName: "m1"), #imageLiteral(resourceName: "m2"), #imageLiteral(resourceName: "m3"), #imageLiteral(resourceName: "m4")]
    //TODO: - 待完成

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.initUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.setUI()
    }
    
    
    //MARK: - fcuntion
    private func initUI() {
        self.view.backgroundColor = UIColor.darkGray
        
        self.imageView = UIImageView()
        self.imageView.image = self.imageArray.first
        self.view.addSubview(self.imageView)
        
        self.pageControl = UIPageControl()
        self.pageControl.backgroundColor = UIColor.lightGray
        self.pageControl.pageIndicatorTintColor = UIColor.darkGray
        self.pageControl.currentPageIndicatorTintColor = UIColor.yellow
        
        self.pageControl.numberOfPages = self.imageArray.count
        self.pageControl.currentPage = 0
        self.pageControl.hidesForSinglePage = true
        self.pageControl.addTarget(self, action: #selector(self.onPageControlAction(_:)), for: .valueChanged)
        self.view.addSubview(pageControl)
        
    }
    
    private func setUI() {
        let frameW = UIScreen.main.bounds.width
        let frameH = UIScreen.main.bounds.height
//        let gap: CGFloat = 10
        
        self.imageView.frame = UIScreen.main.bounds
        
        let pageCenterY = frameH - 15
        self.pageControl.frame = CGRect(x: 0, y: 0, width: frameW, height: 37)
        self.pageControl.center.y = pageCenterY
        
    }
    
    //MARK: - selector
    func onPageControlAction(_ sender: UIPageControl) {
        self.imageView.image = self.imageArray[sender.currentPage]
    }

}

