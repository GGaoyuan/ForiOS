//
//  ViewController.swift
//  iOS
//
//  Created by gaoyuan on 2020/10/13.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let obj = NSObject()
        
        weak var aa = self
        
        view.backgroundColor = .white
    }
    
    @IBAction func effectAction(_ sender: Any) {
//        UIImageView().kf.setImage(with: Source?)
    }
    
    @IBAction func resetAction(_ sender: Any) {
        present(MLTestViewController(), animated: true, completion: nil)
    }
    
    @IBAction func startAction(_ sender: Any) {
        
    }
}
