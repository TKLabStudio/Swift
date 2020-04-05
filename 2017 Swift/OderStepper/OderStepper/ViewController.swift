//
//  ViewController.swift
//  OderStepper
//
//  Created by smallHappy on 2017/2/16.
//  Copyright © 2017年 SmallHappy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var backgroudImageView: UIImageView!
    var adultStepper: UIStepper!
    var adultLabel: UILabel!
    var childrenStepper: UIStepper!
    var childrenLabel: UILabel!
    var totalLabel: UILabel!
    
    enum StepperTag: Int {
        case adult = 1 ,children
    }
    
    let defaultValue = 0.0
    var adultValue :Int{
        return Int(self.adultStepper.value)
    }
    var childrenValue :Int{
        return Int(self.childrenStepper.value)
    }
    var totalMoney :Int{
        return 20000 * self.adultValue + 15000 * self.childrenValue
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.initUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.setUI()
    }

    //MARK: - function
    private func initUI() {
        self.backgroudImageView = UIImageView(image: #imageLiteral(resourceName: "bg"))
    
        self.adultStepper = UIStepper()
        self.adultStepper.minimumValue = 0.0
        self.adultStepper.maximumValue = 10.0
        self.adultStepper.stepValue = 1.0
        self.adultStepper.value = self.defaultValue
        
        self.adultStepper.tag = StepperTag.adult.rawValue
        
        self.adultStepper.addTarget(self, action: #selector(self.onStepperAction(_:)), for: .valueChanged)
        self.view.addSubview(self.adultStepper)
        
        self.adultLabel = UILabel()
        self.adultLabel.text = "\(self.adultValue)"
        self.adultLabel.textAlignment = .center
        self.view.addSubview(self.adultLabel)
        
        self.childrenStepper = UIStepper()
        self.childrenStepper.minimumValue = 0.0
        self.childrenStepper.maximumValue = 10.0
        self.childrenStepper.stepValue = 1.0
        self.childrenStepper.value = self.defaultValue

        self.childrenStepper.tag = StepperTag.children.rawValue
        
        self.childrenStepper.addTarget(self, action: #selector(self.onStepperAction(_:)), for: .valueChanged)
        self.view.addSubview(self.childrenStepper)
        
        self.childrenLabel = UILabel()
        self.childrenLabel.text = "\(self.childrenValue)"
        self.childrenLabel.textAlignment = .center
        self.view.addSubview(self.childrenLabel)
        
        self.totalLabel = UILabel()
        self.totalLabel.text = "\(self.totalMoney)"
        self.view.addSubview(self.totalLabel)
    }
    
    private func setUI() {
        let frameW = UIScreen.main.bounds.width
        let frameH = UIScreen.main.bounds.height
        let gap: CGFloat = 10.0
        
        self.backgroudImageView.frame = UIScreen.main.bounds
        
        let stepperX = frameW * (10 / 22.58), stepperW: CGFloat = 94, stepperH: CGFloat = 29
        let adultCenterY = frameH * (18.42 / 40.08)
        self.adultStepper.frame = CGRect(x: stepperX, y: 0, width: stepperW, height: stepperH)
        self.adultStepper.center.y = adultCenterY
        let labelX = self.adultStepper.frame.origin.x + self.adultStepper.frame.width + gap
        let labelW: CGFloat = 19.0, labelH: CGFloat = 21
        self.adultLabel.frame = CGRect(x: labelX, y: 0, width: labelW, height: labelH)
        self.adultLabel.center.y = adultCenterY
        
        let childrenCenterY = frameH * (21.42 / 40.08)
        self.childrenStepper.frame = CGRect(x: stepperX, y: 0, width: stepperW, height: stepperH)
        self.childrenStepper.center.y = childrenCenterY
        self.childrenLabel.frame = CGRect(x: labelX, y: 0, width: labelW, height: labelH)
        self.childrenLabel.center.y = childrenCenterY
        
        let totalX = frameW * (7.77 / 22.58), totalW: CGFloat = 62, totalH: CGFloat = 21
        let totalCenterY = frameH * (28.5 / 40.08)
        self.totalLabel.frame = CGRect(x: totalX, y: 0, width: totalW, height: totalH)
        self.totalLabel.center.y = totalCenterY
    }
    
    //MARK: - selector
    func onStepperAction(_ sender: UIStepper) {
        guard let tag = StepperTag(rawValue: sender.tag) else { return }
        switch tag {
        case .adult:
            self.adultLabel.text = String(self.adultValue)
        case .children:
            self.childrenLabel.text = String(self.childrenValue)
        }
        self.totalLabel.text = String(self.totalMoney)
    }

}

