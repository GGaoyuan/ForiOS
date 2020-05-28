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
    dispatch_queue_t queue = dispatch_queue_create("", DISPATCH_QUEUE_SERIAL);
    dispatch_async(queue, ^{
        
    });
}

@end
