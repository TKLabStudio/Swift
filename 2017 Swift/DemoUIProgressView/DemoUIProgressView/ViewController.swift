//
//  ViewController.swift
//  DemoUIProgressView
//
//  Created by smallHappy on 2017/8/17.
//  Copyright © 2017年 SmallHappy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var button: UIButton!
    var progressView: UIProgressView!
    var label: UILabel!
    
    var count: Float!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.initUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.setUI()
        self.resetProgress(true) //剛開始隱藏＋歸零
    }
    
    
    //MARK: - fcuntion
    private func initUI() {
        self.view.backgroundColor = UIColor.gray
        
        self.button = UIButton()
        self.button.setTitle("載入", for: .normal)
        self.button.addTarget(self, action: #selector(self.onButtonAction(_:)), for: .touchUpInside)
        self.view.addSubview(self.button)
        
        //TODO: - 待完成
        
        self.label = UILabel()
        self.label.textColor = UIColor.lightGray
        self.label.textAlignment = .center
        self.view.addSubview(self.label)
        
        self.progressView = UIProgressView()
        self.progressView.trackTintColor = UIColor.black
        self.progressView.progressTintColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
        self.view.addSubview(progressView)
    }
    
    private func setUI() {
        let frameW = UIScreen.main.bounds.width
        let frameH = UIScreen.main.bounds.height
        let gap: CGFloat = 10
        
        let buttonH: CGFloat = 30
        let buttonY = frameH / 3 - buttonH / 2
        self.button.frame = CGRect(x: 0, y: buttonY, width: frameW, height: buttonH)
        
        let progressX = frameW / 6
        let progressY = buttonY + buttonH + gap
        let progressW = frameW - progressX * 2
        let progressH: CGFloat = 2
        self.progressView.frame = CGRect(x: progressX, y: progressY, width: progressW, height: progressY)
        
        self.progressView.transform = CGAffineTransform(scaleX: 1.0, y: 3.0) //強制放大厚度
        
        let labelY = progressY + progressH + gap
        self.label.frame = CGRect(x: 0, y: labelY, width: frameW, height: 21)
    }
    
    private func resetProgress(_ value: Bool) {
        self.progressView.isHidden = value
        self.button.isEnabled  = value
        self.label.isHidden = value
        self.count = 0.0 //歸零
        self.progressView.progress = self.count //進度也歸零
    }
    
    //MARK: - selector
    func onButtonAction(_ sender: UIButton) {
        self.resetProgress(false)
        Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.onTimeTick(_:)), userInfo: nil, repeats: true) //timeInterval多久執行一次 repeats是否重複執行
    }
    
    func onTimeTick(_ sender: Timer) {
        //0.0001~0.0100 arc4random產隨機數 (0~99)+1 arc4random是UInt32需強制轉型成Float
        self.count! += 0.0001 * Float(arc4random() % 100 + 1) //確保count不是nil
        self.progressView.progress = self.count //progress使用float
        self.label.text = String(format: "%.2f%%", self.progressView.progress * 100) //設定字串格式(%.2f顯示小數點下兩位)
        if self.count >= 1.0 {
            self.resetProgress(true)
            sender.invalidate() //使Timer失效
        }
    }
}

