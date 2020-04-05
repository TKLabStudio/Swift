//
//  MyCollectionViewCell.swift
//  DemoUICollectionView
//
//  Created by smallHappy on 2017/8/27.
//  Copyright © 2017年 SmallHappy. All rights reserved.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    
    var _imageView: UIImageView!
    var titleTextView: UITextView!
    var previewButton: UIButton!
    var downloadButton: UIButton!
    var favoriteButton: UIButton!
    
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
        self.backgroundColor = UIColor.black
        
        self._imageView = UIImageView()
        self._imageView.contentMode = UIViewContentMode.scaleAspectFit
        self.addSubview(self._imageView)
        
        self.titleTextView = UITextView()
        self.titleTextView.backgroundColor = UIColor.darkGray
        self.titleTextView.alpha = 0.8
        self.titleTextView.layer.cornerRadius = 8.0
        self.titleTextView.isUserInteractionEnabled = false
        self.titleTextView.contentInset = UIEdgeInsets(top: -5, left: 10, bottom: 0, right: 0)
        self.titleTextView.textColor = UIColor.white
        self.addSubview(self.titleTextView)
        
        self.previewButton = UIButton()
        self.previewButton.backgroundColor = UIColor.darkGray
        self.previewButton.alpha = 0.8
        self.previewButton.layer.borderWidth = 1.0
        self.previewButton.layer.borderColor = UIColor.white.cgColor
        self.previewButton.layer.cornerRadius = 8.0
        self.previewButton.setTitleColor(UIColor.white, for: UIControlState())
        self.previewButton.setTitle("預覽", for: UIControlState())
        self.addSubview(self.previewButton)
        
        self.downloadButton = UIButton()
        self.downloadButton.backgroundColor = UIColor.darkGray
        self.downloadButton.alpha = 0.8
        self.downloadButton.layer.borderWidth = 1.0
        self.downloadButton.layer.borderColor = UIColor.white.cgColor
        self.downloadButton.layer.cornerRadius = 8.0
        self.downloadButton.setTitleColor(UIColor.white, for: UIControlState())
        self.downloadButton.setTitle("下載", for: UIControlState())
        self.addSubview(self.downloadButton)
        
        self.favoriteButton = UIButton()
        self.favoriteButton.backgroundColor = UIColor.darkGray
        self.favoriteButton.alpha = 0.8
        self.favoriteButton.layer.borderWidth = 1.0
        self.favoriteButton.layer.borderColor = UIColor.white.cgColor
        self.favoriteButton.layer.cornerRadius = 8.0
        self.favoriteButton.setTitleColor(UIColor.white, for: UIControlState())
        self.favoriteButton.setTitle("收藏", for: UIControlState())
        self.addSubview(self.favoriteButton)
    }
    
    private func setUI() {
        let frameW:CGFloat = self.frame.size.width
        let frameH:CGFloat = self.frame.size.height
        let gap: CGFloat = 10
        
        self._imageView.frame = CGRect(x: 0, y: 0, width: frameW, height: frameH)
        self.titleTextView.frame = CGRect(x: gap, y: gap, width: frameW - gap * 2, height: 21)
        self.previewButton.frame = CGRect(x: gap + ((frameW - gap * 4) / 3 + gap) * 0, y: frameH - gap - 30, width: (frameW - gap * 4) / 3, height: 30)
        self.downloadButton.frame = CGRect(x: gap + ((frameW - gap * 4) / 3 + gap) * 1, y: frameH - gap - 30, width: (frameW - gap * 4) / 3, height: 30)
        self.favoriteButton.frame = CGRect(x: gap + ((frameW - gap * 4) / 3 + gap) * 2, y: frameH - gap - 30, width: (frameW - gap * 4) / 3, height: 30)
    }
    
}
