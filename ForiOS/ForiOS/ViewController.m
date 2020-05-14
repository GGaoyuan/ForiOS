//
//  ViewController.m
//  ForiOS
//
//  Created by gaoyuan on 2020/4/10.
//  Copyright © 2020 gaoyuan. All rights reserved.
//

#import "ViewController.h"
#import "AssignObject.h"

@interface ViewController ()

@property (nonatomic, assign) NSInteger testNum;
@property (nonatomic, assign) AssignObject *assignObject;

@property (nonatomic, copy) NSString *testStr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
//    self.assignObject = [[AssignObject alloc] init];
//    printf(@"%p", self.assignObject);
    
    NSString *str = @"11111";
    NSLog(@"%p", str);
    str = @"222222";
    NSLog(@"%p", str);
    
    _testStr = @"aaaaaaaaa";
    NSLog(@"指针%p", _testStr);
    NSLog(@"地址%p", &_testStr);
    _testStr = @"bbbbbbb";
    NSLog(@"指针%p", _testStr);
    NSLog(@"地址%p", &_testStr);
    
    NSLog(@"地址%p", &_testStr);
}


@end
