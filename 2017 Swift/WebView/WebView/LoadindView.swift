//
//  LoadindView.swift
//  CustomizedLoadingView
//
//  Created by TK on 2017/12/5.
//  Copyright © 2017年 TK. All rights reserved.
//

import UIKit

class LoadindView: UIView {

    enum loadingViewStyle{
        case white, gray
    }
    
    var style = loadingViewStyle.gray
    
    private var activityIndicatorView: UIActivityIndicatorView!
    
    var isAnimating: Bool{
        return self.activityIndicatorView.isAnimating
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initUI()
    }
    
    override func layoutSubviews() {
        self.setUI()
    }
    //MARK: - function
    private func initUI() {
        self.backgroundColor = UIColor.black.withAlphaComponent(0.75) //背景黑色透明
        self.isHidden = true //隱藏
        self.layer.cornerRadius = 8.0 //圓角
        
        self.activityIndicatorView = UIActivityIndicatorView()
        self.activityIndicatorView.hidesWhenStopped = true //載入完即消失
        self.activityIndicatorView.stopAnimating()
        self.activityIndicatorView.activityIndicatorViewStyle = .gray
        self.activityIndicatorView.transform = CGAffineTransform(scaleX: 2, y: 2)
        self.addSubview(activityIndicatorView)
    }
    
    private func setUI() {
        let viewSize: CGFloat = 70.0
        self.frame.size = CGSize(width: viewSize, height: viewSize)
        self.center = CGPoint(x: self.superview!.frame.width / 2,y: self.superview!.frame.height / 2) //自動計算中心點，不管加在誰身上
        self.activityIndicatorView.center = CGPoint(x: viewSize / 2, y: viewSize / 2) //塞在黑色方形的中心點
    }
    
    func start(){
        self.isHidden = false
        self.activityIndicatorView.startAnimating()
        switch self.style {
        case .white:
            self.backgroundColor = UIColor.white.withAlphaComponent(0.6)
            self.activityIndicatorView.activityIndicatorViewStyle = .gray
        case .gray:
            self.backgroundColor = UIColor.black.withAlphaComponent(0.6)
            self.activityIndicatorView.activityIndicatorViewStyle = .white
        }
    }
    func stop(){
        self.isHidden = true
        self.activityIndicatorView.stopAnimating()
    }
    
}
