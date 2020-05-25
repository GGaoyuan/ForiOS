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
#import "UIImageView+WebCache.h"
#import "AssignSubObject.h"
@interface ViewController ()

@property (nonatomic, assign) NSInteger testNum;
@property (nonatomic, assign) AssignObject *assignObject;

@property (nonatomic, copy) NSString *testStr;

@property (nonatomic, weak) id object;

@property (nonatomic, weak) NSObject *testWeak;
@property (nonatomic, assign) NSObject *testAssign;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *url = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1589985186178&di=d9bd6c8a6debf28bc3607aaa5006dd5e&imgtype=0&src=http%3A%2F%2Fn.sinaimg.cn%2Fsinakd20200416ac%2F185%2Fw640h345%2F20200416%2Fdddf-iskepxs4936582.jpg";
    UIImageView *imageView = [[UIImageView alloc] init];
//    imageView.backgroundColor = [UIColor redColor];
    imageView.frame = CGRectMake(100, 100, 200, 120);
    [self.view addSubview:imageView];
    [imageView sd_setImageWithURL:[NSURL URLWithString:url]];
    
    @autoreleasepool {
        self.testWeak = [NSObject new];
        NSLog(@"");
    }
    self.testWeak = [NSObject new];
    
    
    self.testAssign = [NSObject new];
    
    
    
    SwiftMain *swift = [SwiftMain new];
    [swift enter];
    
    NewDictionary *newDic = [NewDictionary new];
    newDic.string = @"11111";
    
    [AssignObject AssignTestMethod];
    [AssignSubObject AssignTestMethod];
}


@end
