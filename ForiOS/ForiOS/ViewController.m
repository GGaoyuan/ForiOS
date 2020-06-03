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
#import "Block.h"
#import "iTouch.h"
@interface ViewController ()

@property (nonatomic, assign) NSInteger result;

@end

@implementation ViewController

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [[Block new] viewDidLoad];
    
//    NSInteger num = 2;
//    NSInteger(^block)(NSInteger) = ^NSInteger(NSInteger n) {
//        return num * n;
//    };
//    num = 1;
//    NSInteger r = block(2);
//
//    NSMutableArray *arr = [NSMutableArray arrayWithObjects:@"1", @"2", nil];
//    [arr addObject:@"5"];
//    NSLog(@"%p", &arr);
//    void(^blk)(void) = ^{
//        NSLog(@"%@", arr);
//        [arr addObject:@"4"];
//        NSLog(@"%p", &arr);
//    };
//    [arr addObject:@"3"];
//    NSLog(@"%p", &arr);
//    arr = nil;
//    NSLog(@"%p", &arr);
//    blk();
    
    

    SwiftMain *main = [SwiftMain new];
    [main webImageWithVc:self];
    
    
    
    
    
    
    
    
    
    
    
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
//    dispatch_queue_t queue2 = dispatch_queue_create("CONCURRENT", DISPATCH_QUEUE_SERIAL);
//    dispatch_async(queue2, ^{
//        NSLog(@"~~~111 ---- %@", [NSThread currentThread]);
//    });
//    
//    dispatch_async(queue2, ^{ NSLog(@"~~~222 ---- %@", [NSThread currentThread]);});
//    dispatch_async(queue2, ^{ NSLog(@"~~~333 ---- %@", [NSThread currentThread]);});
//    dispatch_async(queue2, ^{ NSLog(@"~~~444 ---- %@", [NSThread currentThread]);});
//    dispatch_async(queue2, ^{ NSLog(@"~~~555 ---- %@", [NSThread currentThread]);});
//    dispatch_async(queue2, ^{ NSLog(@"~~~666 ---- %@", [NSThread currentThread]);});
//    dispatch_async(queue2, ^{ NSLog(@"~~~777 ---- %@", [NSThread currentThread]);});
//    dispatch_async(queue2, ^{ NSLog(@"~~~888 ---- %@", [NSThread currentThread]);});
//    NSLog(@"finish");
}

- (void)readMethod {
    
}

- (void)writeMethod {
    
}


@end
