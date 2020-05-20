//
//  ViewController.m
//  ForiOS
//
//  Created by gaoyuan on 2020/4/10.
//  Copyright © 2020 gaoyuan. All rights reserved.
//

#import "ViewController.h"
#import "AssignObject.h"
#import "ForiOS-Swift.h"
#import "NewDictionary.h"

@interface ViewController ()

@property (nonatomic, assign) NSInteger testNum;
@property (nonatomic, assign) AssignObject *assignObject;

@property (nonatomic, copy) NSString *testStr;

@property (nonatomic, weak) id object;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
//    self.assignObject = [[AssignObject alloc] init];
//    printf(@"%p", self.assignObject);
    
//    NSString *str = @"11111";
//    NSLog(@"%p", str);
//    str = @"222222";
//    NSLog(@"%p", str);
//
//    _testStr = @"aaaaaaaaa";
//    NSLog(@"指针%p", _testStr);
//    NSLog(@"地址%p", &_testStr);
//    _testStr = @"bbbbbbb";
//    NSLog(@"指针%p", _testStr);
//    NSLog(@"地址%p", &_testStr);
//
//    NSLog(@"地址%p", &_testStr);
    
    id a = [NewDictionary alloc];
    
    SwiftMain *swift = [SwiftMain new];
    [swift enter];
    
    NewDictionary *newDic = [NewDictionary new];
    newDic.string = @"11111";
}


@end
