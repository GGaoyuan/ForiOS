//
//  ViewController.m
//  ForiOS
//
//  Created by gaoyuan on 2020/4/10.
//  Copyright © 2020 gaoyuan. All rights reserved.
//

#import "ViewController.h"
#import "ForiOS-Swift.h"
#import "NewDictionary.h"
#import "UIImageView+WebCache.h"
#import "KVOObject.h"
#import "ViewController+AAA.h"
@interface ViewController ()

@property (nonatomic, strong) KVOObject *test;

@end

@implementation ViewController

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
   NSLog(@"observeValueForKeyPath");
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.test.name = @"111";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.test = [KVOObject new];
    [self addObserver:self.test forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:nil];
    return;
//    [FPSMonitor start];
    
//    AsyncLabel *label = [[AsyncLabel alloc] init];
//    label.backgroundColor = [UIColor redColor];
//    label.frame = CGRectMake(100, 100, 100, 100);
//    [self.view addSubview:label];
//    return
//    dispatch_async(dispatch_get_main_queue(), ^{
//        NSLog(@"1");
//    });
//    return;
    
    __block NSInteger tickets = 50;
    // queue1 代表北京火车票售卖窗口
    dispatch_queue_t beijing = dispatch_queue_create("beijing", DISPATCH_QUEUE_SERIAL);
    // queue2 代表上海火车票售卖窗口
    dispatch_queue_t shanghai = dispatch_queue_create("shanghai", DISPATCH_QUEUE_SERIAL);
    
    dispatch_semaphore_t sm = dispatch_semaphore_create(1);
    
    dispatch_async(beijing, ^{
        while (1) {
            dispatch_semaphore_wait(sm, DISPATCH_TIME_FOREVER);
            if (tickets > 0) {  //如果还有票，继续售卖
                tickets--;
                NSLog(@"北京卖，剩余票数：%ld 窗口：%@", (long)tickets, [NSThread currentThread]);
                [NSThread sleepForTimeInterval:0.2];
                dispatch_semaphore_signal(sm);
            } else { //如果已卖完，关闭售票窗口
                NSLog(@"北京卖，所有火车票均已售完");
                dispatch_semaphore_signal(sm);
                break;
            }
        }
    });
    dispatch_async(shanghai, ^{
        while (1) {
            dispatch_semaphore_wait(sm, DISPATCH_TIME_FOREVER);
            if (tickets > 0) {  //如果还有票，继续售卖
                tickets--;
                NSLog(@"上海卖，剩余票数：%ld 窗口：%@", (long)tickets, [NSThread currentThread]);
                [NSThread sleepForTimeInterval:0.2];
                dispatch_semaphore_signal(sm);
            } else { //如果已卖完，关闭售票窗口
                NSLog(@"北京卖，所有火车票均已售完");
                dispatch_semaphore_signal(sm);
                break;
            }
        }
    });
}

@end
