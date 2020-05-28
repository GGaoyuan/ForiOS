//
//  MainStart.m
//  CMDTest
//
//  Created by 高源 on 2020/5/28.
//  Copyright © 2020 gaoyuan. All rights reserved.
//

#import "MainStart.h"

@implementation MainStart

- (void)mainStart {
    NSLog(@"mainStart");
    dispatch_queue_t queue = dispatch_queue_create("123", DISPATCH_QUEUE_SERIAL);
    dispatch_async(queue, ^{
        for (int i = 0; i < 100000; i++) {
            if (i == 9998) {
                NSLog(@"1111111111 -------- %@",[NSThread currentThread]);
            }
        }
    });
}

@end
