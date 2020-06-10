//
//  main.m
//  CMDTest
//
//  Created by gaoyuan on 2020/5/27.
//  Copyright © 2020 gaoyuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TestObjct.h"
#import "TestObjct+num1.h"
#import "TestObjct+num2.h"
#import "NSObject+Test.h"
#import "TestObjct+Test.h"
int main(int argc, const char * argv[]) {
    printf("main Start\n");
    @autoreleasepool {
        
        TestObjct *t = [TestObjct new];
        [t ggsimida];
    }
    return 0;
}
