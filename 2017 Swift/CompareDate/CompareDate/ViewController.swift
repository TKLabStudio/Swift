//
//  ViewController.swift
//  CompareDate
//
//  Created by smallHappy on 2017/8/7.
//  Copyright © 2017年 SmallHappy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var yearColumn: ColumnView!
    var monthColumn: ColumnView!
    var dayColumn: ColumnView!
    var button: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.initUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.setUI()
    }

    //MARK: - function
    func initUI() {
        self.yearColumn = ColumnView()
        self.yearColumn.titleLabel.text = "年 year"
        self.view.addSubview(self.yearColumn)
        
        self.monthColumn = ColumnView()
        self.monthColumn.titleLabel.text = "月 month"
        self.view.addSubview(self.monthColumn)
        
        self.dayColumn = ColumnView()
        self.dayColumn.titleLabel.text = "日 day"
        self.view.addSubview(self.dayColumn)
        
        self.button = UIButton()
        self.button.setTitle("取得日期資訊", for: .normal)
        self.button.setTitleColor(UIColor.white, for: .normal)
        self.button.backgroundColor = UIColor(red: 33 / 255, green: 82 / 255, blue: 134 / 255, alpha: 1) //255等分
        self.button.addTarget(self, action: #selector(self.onButtonAction), for: .touchUpInside)
        self.view.addSubview(self.button)

    }
    
    func setUI() {
        let frameW = UIScreen.main.bounds.width
//        let frameH = UIScreen.main.bounds.height
        
        let gap: CGFloat = 10
        let columnW = frameW - 10 - 10
        let columnH: CGFloat = 50
        var _frame = CGRect.zero
        
        _frame = CGRect(x: gap, y: 20, width: columnW, height: columnH)
        self.yearColumn.frame = _frame
        _frame.origin.y += (columnH + gap)
        self.monthColumn.frame = _frame
        _frame.origin.y += (columnH + gap)
        self.dayColumn.frame = _frame
        _frame.origin.y += (columnH + gap)
        self.button.frame = _frame
    }

    //MARK: - selector
    func onButtonAction() {
        //從輸入欄位取得時間
        let year = Int(self.yearColumn.infoTextField.text!) ?? 0
        let month = Int(self.monthColumn.infoTextField.text!) ?? 0
        let day = Int(self.dayColumn.infoTextField.text!) ?? 0 //強制型別轉換，若無法則設定成0
        print("year = \(year), month = \(month), day = \(day)")
        
        //轉換時間格式並做比較
        DateManager.sharedInstance.formatterString = "yyyy.MM.dd"
        guard let inputTime = DateManager.sharedInstance.string2Date("\(year).\(month).\(day)")else{
            return
        }
        
        guard let nowTime = DateManager.sharedInstance.getNowWithFormatter()else{
                return
        }
        DateManager.sharedInstance.compare(baseline: nowTime, comparison: inputTime, ascending: {
            print("past time!")
        }, same: {
            print("same time!")
        }) {
            print("furture time!")
        }
    }

}

