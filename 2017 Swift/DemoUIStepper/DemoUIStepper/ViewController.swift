//
//  ViewController.swift
//  DemoUIStepper
//
//  Created by XCODE on 2017/11/30.
//  Copyright © 2017年 Gjun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var stepper: UIStepper!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.initUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.setUI()
    }
    
    // MARK: - function
    private func initUI() {
        self.stepper = UIStepper()
        self.stepper.maximumValue = 10.0
        self.stepper.minimumValue = 0.0
        self.stepper.value = 5.0
        self.stepper.stepValue = 1.0
        self.stepper.addTarget(self, action: #selector(self.onStepperAction(_:)), for: .valueChanged)
        self.view.addSubview(self.stepper)
    }
    
    private func setUI() {
        let stepperX: CGFloat = 10, stepperY: CGFloat = 20
        let stepperW: CGFloat = 94, stepperH: CGFloat = 29
        self.stepper.frame = CGRect(x: stepperX, y: stepperY, width: stepperW, height: stepperH)
    }
    
    // MARK - selector
    @objc func onStepperAction(_ sender: UIStepper) {
        print(sender.value)
    }

}












