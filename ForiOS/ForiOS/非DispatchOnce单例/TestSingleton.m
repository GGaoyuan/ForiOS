//
//  TestSingleton.m
//  ForiOS
//
//  Created by gaoyuan on 2020/9/10.
//  Copyright © 2020 gaoyuan. All rights reserved.
//

#import "TestSingleton.h"

@implementation TestSingleton

static TestSingleton *obj = nil;
+ (TestSingleton *)instance {
//    dispatch_semaphore_t
    NSLock *lock = [NSLock new];
    if (obj == nil) {
        obj = [TestSingleton new];
    }
    [lock unlock];
    return obj;
}

@end
