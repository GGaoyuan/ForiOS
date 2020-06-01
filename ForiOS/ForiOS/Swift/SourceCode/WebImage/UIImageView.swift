//
//  UIImageView.swift
//  ForiOS
//
//  Created by 高源 on 2020/5/29.
//  Copyright © 2020 gaoyuan. All rights reserved.
//

import UIKit

public enum WebImageOptions {
    case a
    case b
    case c
}

public enum CacheType {
    case none
    case memory
    case disk
}

public typealias DownloadProgress = ((_ receivedSize: Int64, _ totalSize: Int64) -> Void)
public typealias Completion = ((_ image: UIImage?, _ error: NSError?, _ cacheType: CacheType, _ imageURL: URL?) -> Void)

extension UIImageView {
    
    func setupImage(url: URL,
                    placeHolder: UIImage?,
                    options: WebImageOptions?,
                    downloadProgress: DownloadProgress?,
                    completion: Completion?) {
        
    }
}
