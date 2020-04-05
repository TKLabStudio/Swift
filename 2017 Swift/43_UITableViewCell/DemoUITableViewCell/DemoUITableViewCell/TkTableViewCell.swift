//
//  TkTableViewCell.swift
//  DemoUITableViewCell
//
//  Created by TK on 2017/12/26.
//  Copyright © 2017年 SmallHappy. All rights reserved.
//

import UIKit

class TkTableViewCell: UITableViewCell {

    var _imageView :UIImageView!
    var titleTextView: UITextView!
    var previewButton: UIButton!
    var downloadButton: UIButton!
    var favoriteButton: UIButton!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.initUI()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initUI()
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews() //重新對準cell的分隔線（資料稀有）
        self.setUI()
    }
    
    //MARK: - function
    private func initUI() {
        self.backgroundColor = UIColor.black
        
        self._imageView = UIImageView()
        self._imageView.contentMode = .scaleAspectFit
        self.addSubview(self._imageView)
        
        self.titleTextView = UITextView()
        self.titleTextView.backgroundColor = UIColor.darkGray.withAlphaComponent(0.8)
        self.titleTextView.layer.cornerRadius = 8.0
//        self.titleTextView.isEditable = false //是否能輸入文字
//        self.titleTextView.isSelectable = false //是否可以選取
        self.titleTextView.isUserInteractionEnabled = false //是否能與使用者互動(任何觸控街對元件沒用)
        self.titleTextView.contentInset = UIEdgeInsets(top: -5, left: 10, bottom: 0, right: 0) //控制文字位置
        
        self.titleTextView.textColor = UIColor.white
        self.addSubview(self.titleTextView)
        
        self.previewButton = UIButton()
        self.previewButton.backgroundColor = UIColor.darkGray.withAlphaComponent(0.8)
        self.previewButton.layer.borderWidth = 1.0
        self.previewButton.layer.borderColor = UIColor.white.cgColor
        self.previewButton.layer.cornerRadius = 8.0
        self.previewButton.setTitleColor(UIColor.white, for: UIControlState())
        self.previewButton.setTitle("預覽", for: UIControlState())
        self.addSubview(self.previewButton)
        
        self.downloadButton = UIButton()
        self.downloadButton.backgroundColor = UIColor.darkGray.withAlphaComponent(0.8)
        self.downloadButton.layer.borderWidth = 1.0
        self.downloadButton.layer.borderColor = UIColor.white.cgColor
        self.downloadButton.layer.cornerRadius = 8.0
        self.downloadButton.setTitleColor(UIColor.white, for: UIControlState())
        self.downloadButton.setTitle("下載", for: UIControlState())
        self.addSubview(self.downloadButton)
        
        self.favoriteButton = UIButton()
        self.favoriteButton.backgroundColor = UIColor.darkGray.withAlphaComponent(0.8)
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
