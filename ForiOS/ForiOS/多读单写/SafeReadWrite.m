//
//  SafeReadWrite.m
//  ForiOS
//
//  Created by gaoyuan on 2020/9/10.
//  Copyright © 2020 gaoyuan. All rights reserved.
//

#import "SafeReadWrite.h"

@interface SafeReadWrite()

@property (nonatomic, strong) dispatch_queue_t concurrentQueue;

@property (nonatomic, strong) NSMutableDictionary *dic;

@end

@implementation SafeReadWrite

- (instancetype)init {
    self = [super init];
    if (self) {
        self.concurrentQueue = dispatch_queue_create("", DISPATCH_QUEUE_CONCURRENT);
        self.dic = [NSMutableDictionary dictionary];
    }
    return self;
}

- (void)safeSet:(NSString *)key value:(id)value {
    NSString *kKey = [key copy];
    dispatch_barrier_async(self.concurrentQueue, ^{
        [self.dic setObject:value forKey:kKey];
    });
}

- (id)safeGet:(NSString *)key {
    __block id result = nil;
    dispatch_sync(self.concurrentQueue, ^{
        result = self.dic[key];
    });
    return result;
}

@end
