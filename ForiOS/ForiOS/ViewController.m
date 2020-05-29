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
    
//    NSString *url = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1589985186178&di=d9bd6c8a6debf28bc3607aaa5006dd5e&imgtype=0&src=http%3A%2F%2Fn.sinaimg.cn%2Fsinakd20200416ac%2F185%2Fw640h345%2F20200416%2Fdddf-iskepxs4936582.jpg";
//    UIImageView *imageView = [[UIImageView alloc] init];
//    //    imageView.backgroundColor = [UIColor redColor];
//    imageView.frame = CGRectMake(200, 200, 400, 240);
//    [self.view addSubview:imageView];
//    [imageView sd_setImageWithURL:[NSURL URLWithString:url]];

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
