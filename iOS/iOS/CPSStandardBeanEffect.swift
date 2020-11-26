//
//  CPSStandardBeanEffect.swift
//  iOS
//
//  Created by gaoyuan on 2020/11/18.
//

import UIKit

class CPSStandardBeanEffect: NSObject {
    
    private weak var targetView: BeanView?
    private var speed: CGFloat!
    private var timer: CADisplayLink?
    private var startTime: TimeInterval?
    private var effectStartTime = [TimeInterval]()
    
    private var startTimeIndex = 0
    private var nextEffectTime: TimeInterval = 0
    private var perTime: TimeInterval = 0
    
    private var time: TimeInterval = 0
    private var nodeImage: UIImage!
    convenience init(targetView: BeanView) {
        self.init()
        self.targetView = targetView
    }
    
    func start(speed: CGFloat, time: TimeInterval) {
        self.speed = speed
        self.time = time
        let totalEffectNum: CGFloat = 50
        perTime = TimeInterval(CGFloat(time * 1000) / totalEffectNum / CGFloat(1000))
        nextEffectTime += perTime + TimeInterval(CGFloat(getRandomNumber(from: 0, to: 50)) / CGFloat(1000))
        
        for _ in 0...40 {
            let timeInterval = CGFloat(getRandomNumber(from: 0, to: Int(time * 1000))) / CGFloat(1000)
            effectStartTime.append(TimeInterval(timeInterval))
        }
        effectStartTime.sort()
        
        if timer != nil { return }
        timer = CADisplayLink(target: self, selector: #selector(timerHandler))
        timer!.add(to: .main, forMode: .common)
    }
    
    @objc private func timerHandler() {
        guard let timer = self.timer else {
            self.timer?.invalidate()
            return
        }
        if startTime == nil {
            startTime = timer.timestamp
        }
        let currentTime = timer.timestamp - startTime!
//        let resultTime = currentTime - effectStartTime[startTimeIndex]
        let resultTime = currentTime - nextEffectTime
        print("resultTime --- \(resultTime) --- \(nextEffectTime)")
        if fabs(resultTime) < timer.duration || resultTime > 0 {
            if nextEffectTime < time {
                nextEffectTime += perTime + TimeInterval(CGFloat(getRandomNumber(from: 0, to: 50)) / CGFloat(1000))
            showNode(currentTime: currentTime)
            } else {
                stopTimer()
            }
        }
    }
    
    private func stopTimer() {
        startTime = nil
        startTimeIndex = 0
        timer?.invalidate()
        timer = nil
    }
    
    private func showNode(currentTime: TimeInterval) {
        guard let targetView = targetView, let _ = timer else {
            return
        }
        let locationX = CGFloat(getRandomNumber(from: 0, to: Int(targetView.width)))
        let locationY = CGFloat(targetView.height - targetView.bean.height)
        print("\(locationX), \(locationY)")
        
        let layerLength: CGFloat = 10
        let imageLayer = CALayer()
        imageLayer.masksToBounds = true
        imageLayer.backgroundColor = UIColor.clear.cgColor
        imageLayer.contents = UIImage.init(color: .white)!.imageCornerRadius(size: CGSize(width: layerLength, height: layerLength), radius: layerLength/2).cgImage
        imageLayer.frame = CGRect(x:locationX , y: locationY - layerLength/2, width: layerLength, height: layerLength)
        imageLayer.opacity = 1;
        
        let animation = CAKeyframeAnimation(keyPath: "position")
        animation.duration = 2.0
        animation.isRemovedOnCompletion = false
        animation.fillMode = .forwards
        animation.calculationMode = .cubicPaced
        let curvedPath = CGMutablePath()
        curvedPath.move(to: CGPoint(x: locationX, y: locationY))

        let toX = getRandomNumber(from: Int((locationX - 10)), to: Int((locationX + 10)))
        let toY = -100   //向上飘
        curvedPath.addLine(to: CGPoint(x: toX, y: toY))
        animation.path = curvedPath
        targetView.layer.addSublayer(imageLayer)
        
        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale")
        scaleAnimation.fromValue = 1
        scaleAnimation.toValue = (arc4random() % 100) / 100
        scaleAnimation.isRemovedOnCompletion = false
        scaleAnimation.fillMode = .forwards

        let alphaAnimation = CAKeyframeAnimation(keyPath: "opacity")
        alphaAnimation.values = randomValues(count: 10)
        alphaAnimation.duration = 2.0
        alphaAnimation.isRemovedOnCompletion = false
        alphaAnimation.fillMode = .forwards
        
        let animationGroup = CAAnimationGroup()
        animationGroup.fillMode = .forwards
        animationGroup.duration = 2
        animationGroup.animations = [animation, scaleAnimation, alphaAnimation]
        animationGroup.isRemovedOnCompletion = false

        CATransaction.begin()
        CATransaction.setCompletionBlock {
            imageLayer.removeFromSuperlayer()
        }
        imageLayer.add(animationGroup, forKey: "")
        CATransaction.commit()
    }
    
//    func fetchRandomNumber<T: AdditiveArithmetic>(from: T, to: T) -> T {
//        let result = from + T.init(arc4random()) % (to - from + 1)
//        return result
//    }
    
    func getRandomNumber(from: Int, to: Int) -> Int {
        return from + Int(arc4random()) % (to - from + 1)
    }
    
    func randomValues(count: Int) -> [CGFloat] {
        var values = [CGFloat]()
        for _ in 0...count {
            let value: CGFloat = CGFloat((arc4random() % 100)) / CGFloat(100)
            values.append(value)
        }
        return values
    }
    
    deinit {
        print("CPSStandardBeanEffect deinit")
    }
}


