//
//  UIImage+Category.swift
//  Calculate_programmatically
//
//  Created by smallHappy on 2017/2/5.
//  Copyright © 2017年 SmallHappy. All rights reserved.
//

import UIKit

extension UIImage {
    
    func imageWithSize(_ size: CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        self.draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        let newImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return newImage
    }
    
}





