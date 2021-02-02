//
//  MLTestViewController.swift
//  iOS
//
//  Created by gaoyuan on 2020/11/26.
//

import UIKit
import SnapKit


class MLTestViewController: UIViewController {
    
    var testView: MLTestView!
    
    @IBOutlet weak var animationSlider: UISlider!
    @IBOutlet weak var alphaScaleSlider: UISlider!
    @IBOutlet weak var testViewArea: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let test = UIView(frame: CGRect(x: 0, y: 0, width: 375, height: 567))
        test.backgroundColor = .green
        testViewArea.addSubview(test)
        
        let testView = KTVRRDInnerGlowView(frame: CGRect(x: 0, y: 0, width: 375, height: 567))
        testViewArea.addSubview(testView)
        
        
    }

    func mlFunc() {
        
    }
    
    @IBAction func alphaScaleSliderAction(_ sender: Any) {
        print("alphaScaleSliderAction")
    }
    
    @IBAction func animationSliderAction(_ sender: Any) {
        print("animationSliderAction")
    }
    
    deinit {
        print("deinit MLTestViewController")
    }
}
