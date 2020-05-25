//
//  AssignObject.m
//  ForiOS
//
//  Created by 高源 on 2020/5/13.
//  Copyright © 2020 gaoyuan. All rights reserved.
//

#import "AssignObject.h"

@implementation AssignObject

- (instancetype)init {
    self = [super init];
    if (self) {
        NSLog(@"%s", __FUNCTION__);
    }
    return self;
}

- (void)dealloc {
    NSLog(@"%s", __FUNCTION__);
}

+ (void)AssignTestMethod {
    NSLog(@"AssignObject --- AssignTestMethod");
}

@end
