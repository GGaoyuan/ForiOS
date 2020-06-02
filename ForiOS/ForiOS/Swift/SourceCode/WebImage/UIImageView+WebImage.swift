//
//  UIImageView+WebImage.swift
//  ForiOS
//
//  Created by 高源 on 2020/6/2.
//  Copyright © 2020 gaoyuan. All rights reserved.
//

import UIKit

enum WebImageOptions {
    case a
    case b
}

public enum WebImageCacheType {
    case none
    case memory
    case disk
}
public typealias DownloadProgress = ((_ receivedSize: Int64, _ totalSize: Int64) -> Void)
public typealias CompletionHandler = ((_ image: UIImage?, _ error: NSError?, _ cacheType: WebImageCacheType, _ imageURL: URL?) -> Void)

extension WebImage where Base: UIImageView {
    func setupImage(urlString: String, placeHolder: UIImage? = nil, options: WebImageOptions, progress: DownloadProgress, completionHandler: CompletionHandler) {
        
    }
}
