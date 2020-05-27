//
//  main.m
//  CMDTest
//
//  Created by gaoyuan on 2020/5/27.
//  Copyright © 2020 gaoyuan. All rights reserved.
//

#import <Foundation/Foundation.h>

void(^blk3)(int a) = ^{
    
};

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        __block int a = 10;
        void(^blk0)(void) = ^{
            a = 20;
        };
        void(^blk1)(void) = ^{
            a = 30;
        };
        printf("%d", a);
        blk0();
        printf("%d", a);
        blk1();
        printf("%d", a);
    }
    return 0;
}
