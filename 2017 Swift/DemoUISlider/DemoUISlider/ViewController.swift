//
//  ViewController.swift
//  DemoUISlider
//
//  Created by TK on 2017/11/30.
//  Copyright © 2017年 TK. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var slider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.slider = UISlider()
        self.slider.maximumValue = 200
        self.slider.minimumValue = -30
        self.slider.value = 50
        self.slider.setThumbImage(#imageLiteral(resourceName: "carriage"), for: .normal)
        self.slider.setMaximumTrackImage(#imageLiteral(resourceName: "maxTrack"), for: .normal)
        self.slider.setMinimumTrackImage(#imageLiteral(resourceName: "minTrack"), for: .normal)
        self.slider.addTarget(self, action: #selector(onSliderAction(_:)), for: .valueChanged)
        
        self.view.addSubview(slider)
    }

    override func viewWillAppear(_ animated: Bool) {
        let frameW = UIScreen.main.bounds.width
        let gap:CGFloat = 20
        
        self.slider.frame = CGRect(x: 10, y: 80, width: frameW - gap, height: 45) //height為透明的(影響排版)
    }

    @objc func onSliderAction(_ sender: UISlider){
        print(sender.value)
    }

}

