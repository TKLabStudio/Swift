//
//  ViewController.swift
//  WebView
//
//  Created by smallHappy on 2017/2/24.
//  Copyright © 2017年 SmallHappy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var loadingView: LoadindView!
    var siteWebView: UIWebView!
    var htmlWebView: UIWebView!

    var button: UIButton!
    var segmented: UISegmentedControl!
    //TODO: - 待完成

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
        self.view.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.0)
        
        self.button = UIButton(frame: CGRect(x: 10, y: 20, width: 85, height: 30))
        self.button.setTitle("RELOAD", for: .normal)
        self.button.setTitleColor(UIColor.darkGray, for: .normal)
        self.button.layer.borderWidth = 1.0
        self.button.layer.borderColor = UIColor.darkGray.cgColor
        self.button.layer.cornerRadius = 8.0
        self.button.addTarget(self, action: #selector(self.onButtonAction(_:)), for: .touchUpInside)
        self.view.addSubview(self.button)
        
        self.segmented = UISegmentedControl(items: ["Apple", "Android"])
        self.segmented.frame = CGRect(x: 105, y: 20, width: UIScreen.main.bounds.width - 115, height: 30)
        self.segmented.selectedSegmentIndex = 0
        self.segmented.addTarget(self, action: #selector(self.onSegmentedAction(_:)), for: .valueChanged)
        self.view.addSubview(self.segmented)
        
        self.loadingView = LoadindView()
        //self.loadingView.style = .white
        self.view.addSubview(self.loadingView)
        
        self.siteWebView = UIWebView(frame: CGRect(x: 10, y: 60, width: UIScreen.main.bounds.width - 20, height: UIScreen.main.bounds.height - 60 - 10))
        self.siteWebView.layer.borderWidth = 1.0
        self.siteWebView.layer.backgroundColor = UIColor.darkGray.cgColor
        self.siteWebView.layer.cornerRadius = 8.0
        self.siteWebView.delegate = self
        self.siteWebView.scrollView.layer.cornerRadius = 8.0 //拖動完後也要出現圓角
        self.view.addSubview(self.siteWebView)
        
        self.htmlWebView = UIWebView(frame: CGRect(x: 10, y: 60, width: UIScreen.main.bounds.width - 20 , height: 0))
        self.htmlWebView.layer.borderWidth = 1.0
        self.htmlWebView.layer.backgroundColor = UIColor.darkGray.cgColor
        self.htmlWebView.layer.cornerRadius = 8.0
        self.htmlWebView.layer.cornerRadius = 8.0
        self.htmlWebView.delegate = self
        self.view.addSubview(self.htmlWebView)
        
    }
    
    private func setUI() {
        self.view.bringSubview(toFront: loadingView) //將loadingView拉到最前面
        //self.view.sendSubview(toBack: <#T##UIView#>) //拉到最後面
        let request = URLRequest(url: URL(string: "http://apple.com")!)
        self.siteWebView.loadRequest(request)
        
        var html = "<html><body>"
        html += "<h1>HELLO</h1>"
        html += "<p><a href='http://tklab.club'>TK Lab</a></p>"
        html += "</body></html>"
        
        self.htmlWebView.loadHTMLString(html, baseURL: nil)
    }
    
    //MARK: - selector
    func onButtonAction(_ sender: UIButton) {
        if self.loadingView.isAnimating{ return }
        if self.segmented.selectedSegmentIndex == 0 {
            self.siteWebView.reload()
        }
        if self.segmented.selectedSegmentIndex == 1 {
            self.htmlWebView.reload()
        }
    }

    func onSegmentedAction(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            self.htmlWebView.frame.size.height = 0
            self.siteWebView.frame.size.height = UIScreen.main.bounds.height - 60 - 10
        case 1:
            self.siteWebView.frame.size.height = 0
            self.htmlWebView.frame.size.height = UIScreen.main.bounds.height - 60 - 10
        default:
            break
        }
    }
    
}

extension ViewController: UIWebViewDelegate{
    func webViewDidStartLoad(_ webView: UIWebView) { //Start loading
        self.loadingView.start()
    }
    func webViewDidFinishLoad(_ webView: UIWebView) {
        self.loadingView.stop()
    }
    
    
    
}
