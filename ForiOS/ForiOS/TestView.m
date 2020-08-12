//
//  TestView.m
//  ForiOS
//
//  Created by gaoyuan on 2020/8/11.
//  Copyright © 2020 gaoyuan. All rights reserved.
//

#import "TestView.h"

@implementation TestView

+ (Class)layerClass {
    return [TestLayer class];
}

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx {
    
}

- (void)displayLayer:(CALayer *)layer {
    
}

@end
