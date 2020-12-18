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
    
    /// 异步生成一个带圆角的UIImage
    class func asyncImageCornerRadius(image: UIImage, radius: CGFloat, complete: @escaping((UIImage)->())) {
        DispatchQueue.global().async {
            let result = image.imageCornerRadius(size: image.size, radius: radius)
            DispatchQueue.main.async {
                complete(result)
            }
        }
    }
    
    
    /// 生成一个带圆角的UIImage
    func imageCornerRadius(size: CGSize, radius: CGFloat) -> UIImage {
        let rect = CGRect(origin: CGPoint(x: 0, y: 0), size: size)
        UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale)
        UIGraphicsGetCurrentContext()?.addPath(UIBezierPath(roundedRect: rect, byRoundingCorners: UIRectCorner.allCorners, cornerRadii: CGSize(width: radius, height: radius)).cgPath)
        UIGraphicsGetCurrentContext()?.clip()
        draw(in: rect)
        UIGraphicsGetCurrentContext()?.drawPath(using: .fillStroke)
        let output = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return output ?? self
    }
}
