//
//  WebImage.swift
//  ForiOS
//
//  Created by 高源 on 2020/5/29.
//  Copyright © 2020 gaoyuan. All rights reserved.
//

import UIKit

extension UIImageView: WebImageProtocol {}

public protocol WebImageProtocol {
    associatedtype CompatibleType
    var wi: CompatibleType {get}
}
public extension WebImageProtocol {
    var wi: WebImage<Self> {
        return WebImage()
    }
}

public final class WebImage<Base> {
    
}

