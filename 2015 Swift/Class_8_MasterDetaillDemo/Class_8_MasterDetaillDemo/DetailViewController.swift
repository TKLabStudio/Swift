//
//  DetailViewController.swift
//  Class_8_MasterDetaillDemo
//
//  Created by TK on 2016/1/24.
//  Copyright © 2016年 TK. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var labelName: UILabel!

    @IBOutlet weak var textViewContent: UITextView!
    @IBOutlet weak var labelDate: UILabel!
    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let detail:Dictionary<String,String> = self.detailItem as? Dictionary //由於新版傳值時會傳兩個（另一個空值），所以要做判斷
        {
            if let label1 = self.labelName
            {
                label1.text = detail["name"]
            }
            if let label2 = self.labelDate
            {
                label2.text = detail["date"]

            }
            if let label3 = self.textViewContent
            {
                label3.text = detail["content"]
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

