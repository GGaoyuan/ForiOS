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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        testView = MLTestView()
        testView.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        testView.backgroundColor = .red
        view.addSubview(testView)
        testView.blk = {
            self.mlFunc()
        }
    }

    func mlFunc() {
        
    }
    
    @IBAction func dismiss(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
