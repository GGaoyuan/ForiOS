//
//  ViewController+AAA.h
//  ForiOS
//
//  Created by gaoyuan on 2020/7/7.
//  Copyright © 2020 gaoyuan. All rights reserved.
//

#import "ViewController.h"

NS_ASSUME_NONNULL_BEGIN

//分类中的可以写@property，但不会生成setter/getter方法声明和实现，也不会生成私有的成员变量，会编译通过，但是引用变量会报错
@interface ViewController (AAA)

@property (nonatomic, strong) NSString *a;

@end

NS_ASSUME_NONNULL_END
