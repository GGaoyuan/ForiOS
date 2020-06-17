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

- (void)test {
    NSLog(@"111aa --- %@", [NSThread currentThread]);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    dispatch_queue_t queue = dispatch_queue_create("", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
        [self performSelector:@selector(test) withObject:self afterDelay:0];
        [[NSRunLoop currentRunLoop] run];
    });
}

@end


/*
 dispatch_async(queue, ^{
     for (int i = 0; i < 1000000; i++) {
         if (i == 999999) {
             NSLog(@"333 --- %@", [NSThread currentThread]);
         }
     }
 });
 */
