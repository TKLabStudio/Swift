//
//  ViewController.swift
//  Calculate_programmatically
//
//  Created by smallHappy on 2017/2/5.
//  Copyright © 2017年 SmallHappy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var moneyLabel: UILabel!
    var moneyTextField: UITextField!
    var carriageSwitchLabel: UILabel!
    var carriageSwitch: UISwitch!
    var carriageSliderLabel: UILabel!
    var carriageSlider: UISlider!
    var carriageLabel: UILabel!
    var totalTitleLabel: UILabel!
    var totalLabel: UILabel!
    
    var pay = 0
    var carriage = 50
    var total: Int {
        get{
            if self.carriageSwitch.isOn{
                return pay + carriage
            } else {
                return pay
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.initUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.setUI()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //MARK: - function
    func initUI() {
        self.moneyLabel = UILabel()
        self.moneyLabel.text = "購買金額"
        self.view.addSubview(self.moneyLabel)
        self.moneyTextField = UITextField()
        self.moneyTextField.placeholder = "請輸入金額"
        self.moneyTextField.addTarget(self, action: #selector(self.onTextFieldAction(_:)), for: .editingChanged)
        self.view.addSubview(self.moneyTextField)
        
        self.carriageSwitchLabel = UILabel()
        self.carriageSwitchLabel.text = "運費另計"
        self.view.addSubview(self.carriageSwitchLabel)
        self.carriageSwitch = UISwitch()
        self.carriageSwitch.isOn = false
        self.carriageSwitch.addTarget(self, action: #selector(self.onSwitchAction(_:)), for: .valueChanged)
        self.view.addSubview(self.carriageSwitch)
        
        self.carriageSliderLabel = UILabel()
        self.carriageSliderLabel.text = "運費金額"
        self.view.addSubview(self.carriageSliderLabel)
        self.carriageSlider = UISlider()
        self.carriageSlider.minimumValue = 10
        self.carriageSlider.maximumValue = 200
        self.carriageSlider.value = Float(self.carriage)
        self.carriageSlider.setMinimumTrackImage(#imageLiteral(resourceName: "minTrack"), for: .normal)
        self.carriageSlider.setMaximumTrackImage(#imageLiteral(resourceName: "maxTrack"), for: .normal)
        
        self.carriageSlider.setThumbImage(#imageLiteral(resourceName: "carriage").imageWithSize(CGSize(width: 25, height: 25)), for: .normal) //imageWithSize自定義方法，自訂圖案大小
        
        self.carriageSlider.addTarget(self, action: #selector(self.onSliderAction(_:)), for: .valueChanged)
        self.view.addSubview(self.carriageSlider)
        
        self.carriageLabel = UILabel()
        self.carriageLabel.text = "\(self.carriage)" //另一種表示法
//        self.carriageLabel.text = String(self.carriage)
        self.carriageLabel.textAlignment = .center
        self.view.addSubview(self.carriageLabel)
        
        self.totalTitleLabel = UILabel()
        self.totalTitleLabel.text = "總金額"
        self.view.addSubview(self.totalTitleLabel)
        self.totalLabel = UILabel()
        self.totalLabel.text = "\(self.total)"
        self.view.addSubview(self.totalLabel)
    }
    
    func setUI() {
        let frameW = UIScreen.main.bounds.width
        //let frameH = UIScreen.main.bounds.height
        
        let labelY: CGFloat = 20
        let labelW: CGFloat = 70
        let labelH: CGFloat = 40
        let gap: CGFloat = 10
        
        self.moneyLabel.frame = CGRect(x: gap, y: labelY, width: labelW, height: labelH)
        let columnX = gap + labelW + gap
        let columnW = frameW - (columnX + gap)
        self.moneyTextField.frame = CGRect(x: columnX, y: labelY, width: columnW, height: labelH)
        
        let switchY = gap + labelH + gap
        self.carriageSwitchLabel.frame = CGRect(x: gap, y: switchY, width: labelW, height: labelH)
        
        self.carriageSwitch.frame.origin = CGPoint(x: columnX, y: 0)
        self.carriageSwitch.center.y = self.carriageSwitchLabel.center.y
        
        let sliderY = switchY + labelH + gap
        self.carriageSliderLabel.frame = CGRect(x: gap, y: sliderY, width: labelW, height: labelH)
        self.carriageSlider.frame = CGRect(x: columnX, y: sliderY, width: columnW, height: labelH)
        
        let carriageY = sliderY + labelH + gap
        self.carriageLabel.frame = CGRect(x: columnX, y: carriageY, width: columnW, height: labelH)
        
        let totalY = carriageY + labelH + gap
        self.totalTitleLabel.frame = CGRect(x: gap, y: totalY, width: labelW, height: labelH)
        self.totalLabel.frame = CGRect(x: columnX, y: totalY, width: columnW, height: labelH)
        
    }
    
    //MARK: - selector
    func onTextFieldAction(_ sender: UITextField) {
        guard let money = sender.text,let pay = Int(money) else {
            self.totalLabel.text = "Error"
            return
        }
        self.pay = pay
        self.totalLabel.text = "\(self.total)"
    }
    
    func onSwitchAction(_ sender: UISwitch) {
        print(sender.isOn ? "運費納入計算" : "運費不納入計算")
        self.totalLabel.text = "\(total)"
        
    }
    
    func onSliderAction(_ sender: UISlider) {
        print("運費：", sender.value)
        self.carriage = Int(sender.value)
        self.carriageLabel.text = "\(self.carriage)"
        self.totalLabel.text = "\(self.total)"
    }

}

