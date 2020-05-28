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
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"111111");
    });
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        NSLog(@"111111");
//    });
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        NSLog(@"111111");
//    });
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        NSLog(@"111111");
//    });
}

@end
