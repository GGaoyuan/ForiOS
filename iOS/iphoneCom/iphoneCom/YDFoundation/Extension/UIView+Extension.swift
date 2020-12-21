//
//  UIView+Extension.swift
//  iOS
//
//  Created by gaoyuan on 2020/11/18.
//

import UIKit

extension UIView {
    @objc var x: CGFloat {
        get {
            return frame.origin.x
        }
        set (newValue){
            frame.origin.x = newValue
        }
    }
    @objc var y: CGFloat {
        get {
            return frame.origin.y
        }
        set (newValue){
            frame.origin.y = newValue
        }
    }
    @objc var width: CGFloat {
        get {
            return frame.size.width
        }
        set (newValue){
            frame.size.width = newValue
        }
    }
    @objc var height: CGFloat {
        get {
            return frame.size.height
        }
        set (newValue){
            frame.size.height = newValue
        }
    }
    @objc var centerX: CGFloat {
        get {
            return center.x
        }
        set (newValue){
            var center = self.center
            center.x = newValue
            self.center = center
        }
    }
    @objc var centerY: CGFloat {
        get {
            return self.center.y
        }
        set (newValue){
            var center = self.center
            center.y = newValue
            self.center = center
        }
    }
    @objc var size: CGSize {
        get {
            return frame.size
        }
        set (newValue){
            frame.size = newValue
        }
    }
}
