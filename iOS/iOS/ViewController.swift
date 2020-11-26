//
//  ViewController.swift
//  iOS
//
//  Created by gaoyuan on 2020/10/13.
//

import UIKit


class ViewController: UIViewController {
    
    private var timer: CADisplayLink?
    
//    private var effect: CPSStandardBeanEffect!
    
    private var bean: BeanView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black

//        bean = BeanView(frame: CGRect(x: 200, y: -300, width: 50, height: 300), a: NSObject())
        bean = BeanView(frame: CGRect(x: 200, y: -300, width: 50, height: 300), a: NSObject())
        view.addSubview(bean)
    }
    
    @IBAction func effectAction(_ sender: Any) {
//        effect.showEffect()
    }
    
    @IBAction func resetAction(_ sender: Any) {
        
    }
    
    @IBAction func startAction(_ sender: Any) {
        let totalHeight = view.height
        let speed = CGFloat(totalHeight) / CGFloat(10)
        bean.effect.start(speed: speed, time: 10)
        UIView.animate(withDuration: 10, delay: 0, options: .curveLinear) {
            self.bean.y = self.view.height
        } completion: { (_) in

        }
    }
}


class BeanView: UIView {
    var bean: UIView!
    
    var effect: CPSStandardBeanEffect!
    
    convenience init(frame: CGRect, a: NSObject) {
        self.init(frame: frame)
        clipsToBounds = false
        backgroundColor = UIColor.yellow.withAlphaComponent(0.2)
        bean = UIView()
        bean.backgroundColor = .red
        addSubview(bean)
        bean.frame = CGRect(x: 0, y: frame.height - frame.width, width: frame.width, height: frame.width)
        
        effect = CPSStandardBeanEffect(targetView: self)
    }
    
//    private
}
