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

@property (nonatomic, weak) id object;

@property (nonatomic, weak) NSObject *testWeak;
@property (nonatomic, assign) NSObject *testAssign;

@property (nonatomic, copy) NSString *testStr;
@property (nonatomic, copy) NSMutableArray *testArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    dispatch_queue_t queue = dispatch_queue_create("id", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 1000000; i++) {
            if (i == 999990) {
                NSLog(@"1111 ---- %@", [NSThread currentThread]);
            }
        }
    });
    dispatch_async(queue, ^{
        for (int i = 0; i < 10000000; i++) {
            if (i == 9999900) {
                NSLog(@"2222 ---- %@", [NSThread currentThread]);
            }
        }
    });
    dispatch_async(queue, ^{
        for (int i = 0; i < 1000000; i++) {
            if (i == 999990) {
                NSLog(@"3333 ---- %@", [NSThread currentThread]);
            }
        }
    });
    dispatch_sync(queue, ^{
        for (int i = 0; i < 1000000; i++) {
            if (i == 909999) {
                NSLog(@"4444 ---- %@", [NSThread currentThread]);
            }
        }
    });
    dispatch_sync(queue, ^{
        for (int i = 0; i < 100000; i++) {
            if (i == 99999) {
                NSLog(@"5555 ---- %@", [NSThread currentThread]);
            }
        }
    });
    NSLog(@"finish");
//    NSString *url = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1589985186178&di=d9bd6c8a6debf28bc3607aaa5006dd5e&imgtype=0&src=http%3A%2F%2Fn.sinaimg.cn%2Fsinakd20200416ac%2F185%2Fw640h345%2F20200416%2Fdddf-iskepxs4936582.jpg";
//    UIImageView *imageView = [[UIImageView alloc] init];
////    imageView.backgroundColor = [UIColor redColor];
//    imageView.frame = CGRectMake(100, 100, 200, 120);
//    [self.view addSubview:imageView];
//    [imageView sd_setImageWithURL:[NSURL URLWithString:url]];
//    
//    self.testStr = @"1111";
//    self.testArray = [[NSMutableArray alloc] init];
//    [self.testArray addObject:[NSObject new]];
//    SwiftMain *swift = [SwiftMain new];
//    [swift enter];
//
//    NewDictionary *newDic = [NewDictionary new];
//    newDic.string = @"11111";
//
//    [AssignObject AssignTestMethod];
//    [AssignSubObject AssignTestMethod];
}


@end
