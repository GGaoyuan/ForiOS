//
//  Block.m
//  ForiOS
//
//  Created by gaoyuan on 2020/6/1.
//  Copyright © 2020 gaoyuan. All rights reserved.
//

#import "Block.h"

@implementation Block

- (void)viewDidLoad {
    void(^block)(void) = ^{
        NSLog(@"Hello world");
    };
    block();
    NSLog(@"%@", block);    //全局静态block  __NSGlobalBlock__
    
    int a = 10;
    void(^block1)(void) = ^{
        NSLog(@"Hello world - %d", a);
    };
    block1();
    NSLog(@"%@", block1);   //堆Block  __NSMallocBlock__
    
    NSLog(@"%@", ^{
        NSLog(@"Hello world - %d", a);  //栈Block  __NSStackBlock__
    });
}

@end
