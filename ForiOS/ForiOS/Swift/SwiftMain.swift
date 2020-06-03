//
//  SwiftMain.swift
//  ForiOS
//
//  Created by 高源 on 2020/5/18.
//  Copyright © 2020 gaoyuan. All rights reserved.
//

import UIKit

class SwiftMain: NSObject {
    @objc func enter() {
        let designPatter = DesignPatternEntrance()
        designPatter.start()
    }
    
    @objc func webImage(vc: UIViewController) {
        let imageView = UIImageView()
        imageView.backgroundColor = .red
        imageView.frame = CGRect(x: 200, y: 200, width: 400, height: 240)
        vc.view.addSubview(imageView)
        
        
        let url = "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1589985186178&di=d9bd6c8a6debf28bc3607aaa5006dd5e&imgtype=0&src=http%3A%2F%2Fn.sinaimg.cn%2Fsinakd20200416ac%2F185%2Fw640h345%2F20200416%2Fdddf-iskepxs4936582.jpg"
        imageView.wi.setupImage(urlString: url, options: .a, progress: { (r, a) in
            
        }) { (image, error, cacheType, url) in
            
        }
        print("")
        
        let p1 = Person(name: "gao", age: 18)
        var p2 = p1
        p2.name = "yuan"
        print("%p", p1)
        print("%p", p2)
    }
}

struct Person {
    var name: String
    var age: Int {
        didSet {
            
        }
    }
    var btn: UIButton!
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}
