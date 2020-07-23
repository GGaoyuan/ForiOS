//
//  NewDictionary.m
//  ForiOS
//
//  Created by 高源 on 2020/5/19.
//  Copyright © 2020 gaoyuan. All rights reserved.
//

#import "NewDictionary.h"
#import <objc/runtime.h>

@interface NewDictionary()

@property (nonatomic, strong) NSMutableDictionary *backingStore;

@end

@implementation NewDictionary

@dynamic string, number, date, opaqueObject;

+ (void)initialize {
    NSLog(@"NewDictionary initialize");
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _backingStore = [NSMutableDictionary new];
    }
    return self;
}

id autoDictionaySetter(id self, SEL _cmd) {
    NewDictionary *typeSelf = (NewDictionary *)self;
    NSMutableDictionary *backingStore = typeSelf.backingStore;
    NSString *key = NSStringFromSelector(_cmd);
    NSLog(@"autoDictionaySetter --- %@", NSStringFromSelector(_cmd));
    return [backingStore objectForKey:key];
}

void autoDictionayGetter(id self, SEL _cmd, id value) {
    //
}

//第一步
+ (BOOL)resolveInstanceMethod:(SEL)sel {
    NSString *selectorStr = NSStringFromSelector(sel);
    NSLog(@"resolveInstanceMethod --- %@", selectorStr);
    if ([selectorStr hasPrefix:@"set"]) {
        class_addMethod(self, sel, (IMP)autoDictionaySetter, "v@:@");
    } else {
        class_addMethod(self, sel, (IMP)autoDictionayGetter, "v@:@");
    }
    return true;
}

+ (BOOL)resolveClassMethod:(SEL)sel {
    NSString *selectorStr = NSStringFromSelector(sel);
    NSLog(@"resolveClassMethod --- %@", selectorStr);
    return true;
}
//第二步
- (id)forwardingTargetForSelector:(SEL)aSelector {
    NSString *selectorStr = NSStringFromSelector(aSelector);
    NSLog(@"forwardingTargetForSelector --- %@", selectorStr);
    return [NSObject new];
}
//第三部
- (void)forwardInvocation:(NSInvocation *)anInvocation {
    
}

@end
