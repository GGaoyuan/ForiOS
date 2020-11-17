//
//  UIImageView+Extension.swift
//  iOS
//
//  Created by gaoyuan on 2020/11/17.
//

import UIKit

extension UIImage {
    
    convenience init?(color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) {
        UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale)
        let context = UIGraphicsGetCurrentContext()

        context?.setFillColor(color.cgColor)
        context?.fill(CGRect(x: 0, y: 0, width: size.width, height: size.height))
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        self.init(cgImage: (image?.cgImage)!)
        UIGraphicsEndImageContext()
    }
}
