//
//  HomeViewController.swift
//  iOS
//
//  Created by gaoyuan on 2020/12/18.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
     
        let btn = { () -> UIButton in
            let button = UIButton(type: .custom)
            button.backgroundColor = .clear
            button.addTarget(self, action: #selector(leakTest), for: .touchUpInside)
            button.setTitle("1111", for: .normal)
            button.setTitleColor(.red, for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
            button.adjustsImageWhenHighlighted = false
            view.addSubview(button)
            return button
        }()
        view.addSubview(btn)
        btn.frame = CGRect(x: 100, y: 100, width: 100, height: 100)        
    }
    
    @objc func leakTest() {
        let testVC = MLTestViewController()
        present(testVC, animated: true, completion: nil)
    }
}
