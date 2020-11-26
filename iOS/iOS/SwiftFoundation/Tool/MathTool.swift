//
//  MathTool.swift
//  iOS
//
//  Created by gaoyuan on 2020/11/19.
//

import Foundation

protocol MathTool {}

extension MathTool {
    
    func fetchRandomNumber<T>(from: T, to: T) -> T {
        
        return from
    }
    
    func getRandomNumber(from: Int, to: Int) -> Int {
        return from + Int(arc4random()) % (to - from + 1)
    }
}
