//
//  ViewController.swift
//  ChooseVersion
//
//  Created by smallHappy on 2017/8/7.
//  Copyright © 2017年 SmallHappy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var dataArray: [String]!
    var result: String!
    
    var titleLabel: UILabel!
    var pickerView: UIPickerView!
    var answerLabel: UILabel!
    var answerButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.initData()
        self.initUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.setUI()
    }
    
    //MARK: - function
    private func initUI() {
        self.view.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.0)
        
        self.titleLabel = UILabel()
        self.titleLabel.text = "請問目前的作業系統為何？"
        self.titleLabel.textAlignment = .center
        self.view.addSubview(self.titleLabel)
        
        self.pickerView = UIPickerView()
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
        self.pickerView.selectRow(self.getPickerViewSelection(), inComponent: 0, animated: true)
        self.view.addSubview(self.pickerView)
        
        self.answerLabel = UILabel()
        self.answerLabel.text = "答案？"
        self.answerLabel.textAlignment = .center
        self.view.addSubview(self.answerLabel)
        
        self.answerButton = UIButton()
        self.answerButton.setTitle("回答答案", for: .normal)
        self.answerButton.setTitleColor(UIColor.darkGray, for: .normal)
        self.answerButton.setTitleColor(UIColor(red: 132 / 255, green: 189 / 255, blue: 0 / 255, alpha: 1.0), for: .highlighted)
        self.answerButton.layer.borderWidth = 1.0 //邊線寬
        self.answerButton.layer.borderColor = UIColor.darkGray.cgColor
        self.answerButton.layer.cornerRadius = 15 //圓角
        self.answerButton.addTarget(self, action: #selector(self.onButtonAction(_:)), for: .touchUpInside)
        //TODO: - todo
        self.view.addSubview(self.answerButton)
    }
    
    private func setUI() {
        let frameW = UIScreen.main.bounds.width
//        let frameH = UIScreen.main.bounds.height
        let gap: CGFloat = 10
        
        let labelH: CGFloat = 20
        self.titleLabel.frame = CGRect(x: 0, y: 20, width: frameW, height: labelH)
        
        let pickerX = frameW * (1 / 6)
        let pickerY = self.titleLabel.frame.origin.y + self.titleLabel.frame.height + gap
        let pickerW = frameW * (2 / 3)
        let pickerH: CGFloat = 130
        self.pickerView.frame = CGRect(x: pickerX, y: pickerY, width: pickerW, height: pickerH)
        
        let answerY = self.pickerView.frame.origin.y + self.pickerView.frame.height + gap
        self.answerLabel.frame = CGRect(x: 0, y: answerY, width: frameW, height: labelH)
        
        let buttonY = self.answerLabel.frame.origin.y + self.answerLabel.frame.height + gap
        let buttonW = frameW - gap * 2
        let buttonH: CGFloat = 30
        self.answerButton.frame = CGRect(x: gap, y: buttonY, width: buttonW, height: buttonH)
    }
    
    private func initData() {
        self.dataArray = [String]()
        for i in 5...11
        {
        self.dataArray.append("iOS\(i)")
        }
        result = self.dataArray[self.getPickerViewSelection()] //預設放中間
    }
    
    private func getPickerViewSelection() -> Int {
        var returnValue = self.dataArray.count / 2
        if self.dataArray.count % 2 == 0{
            returnValue -= 1
        }
        
        return returnValue
    }
    
    //MARK: - selector
    func onButtonAction(_ sender: UIButton) {
        if self.result == "iOS11"{
            self.answerLabel.text = "right answer"
        } else {
            self.answerLabel.text = "wrong answer"
        }
        
    }

}

extension ViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if row >= self.dataArray.count { return "" } //陣列數列如果變動，將不會閃退
        return self.dataArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if row >= self.dataArray.count { return }
        self.result = self.dataArray[row]
    }
    
}

extension ViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.dataArray.count
    }
    
}
