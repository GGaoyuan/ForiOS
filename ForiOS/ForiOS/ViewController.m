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
@interface ViewController ()


@end

@implementation ViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    dispatch_queue_t queue = dispatch_queue_create("", DISPATCH_QUEUE_SERIAL);
    dispatch_async(queue, ^{
        for (int i = 0; i < 1000000; i++) {
            if (i == 999999) {
                NSLog(@"111 --- %@", [NSThread currentThread]);
            }
        }
    });
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 1000000; i++) {
            if (i == 999999) {
                NSLog(@"222 --- %@", [NSThread currentThread]);
            }
        }
    });
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 1000000; i++) {
            if (i == 999999) {
                NSLog(@"333 --- %@", [NSThread currentThread]);
            }
        }
    });
}

@end
