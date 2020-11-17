//
//  ViewController.swift
//  iOS
//
//  Created by gaoyuan on 2020/10/13.
//

import UIKit

class ViewController: UIViewController {
    
    private var timer: CADisplayLink?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let emitterLayer = CAEmitterLayer()
        emitterLayer.emitterSize = CGSize(width: 100, height: 100)
        emitterLayer.emitterPosition = CGPoint(x: kScreenWidth, y: 100)
//        emitterLayer.emitterShape = .circle
        emitterLayer.emitterShape = .rectangle
//
        emitterLayer.emitterMode = .surface
        view.layer.insertSublayer(emitterLayer, at: 0)

        let cell = TestEmitterCell()
        cell.name = "sparkle"
        
        let image = UIImage(color: .white, size: CGSize(width: 20, height: 20))
        cell.contents = image?.cgImage
        cell.color = UIColor.red.cgColor
        
        cell.birthRate = 30
        cell.lifetime = 2
        cell.lifetimeRange = 5

        cell.alphaRange = 0.5;
        cell.alphaSpeed = -0.9;
        cell.velocity = 10;
        cell.velocityRange = 50;
        cell.emissionRange = .pi / 4;
        cell.emissionLongitude = -.pi / 2;

        cell.scale = 0.3;
        cell.scaleRange = 0.2;
        cell.scaleSpeed = -0.1;

        emitterLayer.emitterCells = [cell]
    }
    
    
    @IBAction func startAction(_ sender: Any) {
        
    }
}


class TestEmitterCell: CAEmitterCell {
    
    private var timer: CADisplayLink?
    private var startTimeStamp: TimeInterval?
    
    override init() {
        super.init()
        timer = CADisplayLink(target: self, selector: #selector(timerHandler))
        timer!.add(to: .main, forMode: .common)
        
    }
    
    @objc private func timerHandler() {
        guard let timeStamp = timer?.timestamp else {
            return
        }
        if startTimeStamp == nil {
            startTimeStamp = timeStamp
        }
        
        let changeTime = 2 - (timeStamp - startTimeStamp!)
        if changeTime < 0 {
//            alphaRange = 0.5
            let value = self.value(forKey: "opacity")
            let value1 = self.value(forKeyPath: "layer.opacity")
            let view1 = self.value(forKeyPath: "view.opacity")
            let view11 = self.value(forKeyPath: "view.layer.opacity")
            let cell1 = self.value(forKeyPath: "cell.opacity")
            let cell11 = self.value(forKeyPath: "cell.layer.opacity")
            let view2 = self.value(forKeyPath: "view.alpha")
            let cell2 = self.value(forKeyPath: "cell.alpha")
        
            
            timer?.invalidate()
            timer = nil
            startTimeStamp = nil
            print("2222222")
        }
        print("1111111")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
