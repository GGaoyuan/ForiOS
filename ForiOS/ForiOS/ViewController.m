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

@property (nonatomic, assign) NSInteger result;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    dispatch_queue_t queue = dispatch_queue_create("CONCURRENT", DISPATCH_QUEUE_CONCURRENT);
//    dispatch_async(queue, ^{ NSLog(@"111 ---- %@", [NSThread currentThread]);});
//    dispatch_async(queue, ^{ NSLog(@"222 ---- %@", [NSThread currentThread]);});
//    dispatch_async(queue, ^{ NSLog(@"333 ---- %@", [NSThread currentThread]);});
//    dispatch_async(queue, ^{ NSLog(@"444 ---- %@", [NSThread currentThread]);});
//    dispatch_async(queue, ^{ NSLog(@"555 ---- %@", [NSThread currentThread]);});
//    dispatch_async(queue, ^{ NSLog(@"666 ---- %@", [NSThread currentThread]);});
//    dispatch_async(queue, ^{ NSLog(@"777 ---- %@", [NSThread currentThread]);});
//    dispatch_async(queue, ^{ NSLog(@"888 ---- %@", [NSThread currentThread]);});
    
//    dispatch_queue_t queue2 = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    dispatch_queue_t queue2 = dispatch_get_main_queue();
    dispatch_queue_t queue2 = dispatch_queue_create("CONCURRENT", DISPATCH_QUEUE_SERIAL);
    dispatch_async(queue2, ^{
        NSLog(@"~~~111 ---- %@", [NSThread currentThread]);
    });
    
    dispatch_async(queue2, ^{ NSLog(@"~~~222 ---- %@", [NSThread currentThread]);});
    dispatch_async(queue2, ^{ NSLog(@"~~~333 ---- %@", [NSThread currentThread]);});
    dispatch_async(queue2, ^{ NSLog(@"~~~444 ---- %@", [NSThread currentThread]);});
    dispatch_async(queue2, ^{ NSLog(@"~~~555 ---- %@", [NSThread currentThread]);});
    dispatch_async(queue2, ^{ NSLog(@"~~~666 ---- %@", [NSThread currentThread]);});
    dispatch_async(queue2, ^{ NSLog(@"~~~777 ---- %@", [NSThread currentThread]);});
    dispatch_async(queue2, ^{ NSLog(@"~~~888 ---- %@", [NSThread currentThread]);});
    NSLog(@"finish");
}

- (void)readMethod {
    
}

- (void)writeMethod {
    
}


@end
