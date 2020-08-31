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
#import "NewDictionary2.h"
#import "UIImageView+WebCache.h"
#import "KVOObject.h"
#import "ViewController+AAA.h"
#import "UIImageView+WebCache.h"
#import "TestString.h"
#import "AlgStart.h"
#import <dlfcn.h>
#import "DrawRectViewController.h"

@interface ViewController ()

@property (nonatomic, strong) KVOObject *test;
@property (nonatomic, copy) NSMutableArray *aaa;
@end

@implementation ViewController


#pragma mark - 二进制重排

void __sanitizer_cov_trace_pc_guard_init(uint32_t *start,
                                         uint32_t *stop) {
    static uint64_t N;  // Counter for the guards.
    if (start == stop || *start) return;  // Initialize only once.
    printf("INIT: %p %p\n", start, stop);
    for (uint32_t *x = start; x < stop; x++)
        *x = ++N;  // Guards should start from 1.
}

void __sanitizer_cov_trace_pc_guard(uint32_t *guard) {
    if (!*guard) return;  // Duplicate the guard check.
    void *PC = __builtin_return_address(0); //PC就是指向各个函数调用完__sanitizer_cov_trace_pc_guard之后的下一行代码的内存地址
    Dl_info info;
    dladdr(PC, &info);
    printf("fname=%s \nfbase=%p \nsname=%s\nsaddr=%p \n",info.dli_fname,info.dli_fbase,info.dli_sname,info.dli_saddr);
    char PcDescr[1024];
    printf("guard: %p %x PC %s\n", guard, *guard, PcDescr);
}

#pragma mark - 添加按钮
- (void)addBtn {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 100, 100, 100);
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}
- (void)buttonAction {
    [self drawRectQuestion];
}

#pragma mark - DrawRect内存暴增
- (void)drawRectQuestion {
    DrawRectViewController *vc = [DrawRectViewController new];
    [self presentViewController:vc animated:true completion:nil];
}


#pragma mark - aaa

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
   NSLog(@"observeValueForKeyPath");
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    self.test.name = @"111";
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
////        NSLog(@"%@", FPSMonitor.monitor.fpsThread);
//        [[NSRunLoop currentRunLoop] run];
//        [self performSelector:@selector(test123) withObject:nil afterDelay:0];
//
//    });
    NSLog(@"发送:%@",[NSThread currentThread]);
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"发送:%@",[NSThread currentThread]);
        [[NSNotificationCenter defaultCenter] postNotificationName:@"noti" object:nil];
    });

}

- (void)notificationCode{
//    dispatch_async(dispatch_get_main_queue(), ^{
//       //更新 UI 操作
//    });
    NSLog(@"notificationCode:%@",[NSThread currentThread]);
}

- (void)test123 {
    NSLog(@"111");
}


////////////////



- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addBtn];
    return;
    
    
    NewDictionary *dic = [NewDictionary new];
    if ([dic isKindOfClass:[NSObject class]]) {
        NSLog(@"");
    } else {
        NSLog(@"");
    }
    
    
//    SwiftMain *swiftMain = [SwiftMain new];
//    [swiftMain enter];
//    return;
    
//    [ThreadTest test];
//    return;
    
    [AlgStart start];
    return;
        
    [self testSemaphore];
    return;
    
//    NSString *a1 = nil
    @autoreleasepool {
        NewDictionary *a1 = [NewDictionary new];
    }
    NSString *b1 = @"2";
    
    NSLog(@"");
    return;
    
    
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.frame = CGRectMake(100, 100, 100, 100);
    imageView.backgroundColor = [UIColor yellowColor];
    [imageView sd_setImageWithURL:[NSURL URLWithString:@"http://service.ivydad.com/book/a193b33e-c704-9a5f-49a4-4126a5330daa/f204d16d6477a64b1e6abe461843791d.jpeg"]];
    [self.view addSubview:imageView];
//    [imageView sd_setImageWithURL:[NSURL URLWithString:@"http://service.ivydad.com/book/a193b33e-c704-9a5f-49a4-4126a5330daa/f204d16d6477a64b1e6abe461843791d.jpeg"] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
//        NSLog(@"");
//    }];
    
    return;
    
    
    NSInteger a = 10;
    NSInteger b = 20;
    
    self.aaa = [NSMutableArray array];
    [self.aaa addObject:[NSObject new]];
    
    NSLog(@"%d,   %d", a, b);
    a = a + b;
    b = a - b;
    a = a - b;
    NSLog(@"%d,   %d", a, b);
    return;
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationCode) name:@"noti" object:nil];
    [[NSNotificationCenter defaultCenter] addObserverForName:@"noti" object:nil queue:nil usingBlock:^(NSNotification * _Nonnull note) {
        /**处理通知代码**/
        NSLog(@"usingBlock:%@",[NSThread currentThread]);
    }];
    return;
    
    self.test = [KVOObject new];
    [self addObserver:self.test forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:nil];
    NSLog(@"2222");
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"111");
    });
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
}

- (void)testSemaphore {
//    dispatch_queue_t queueA = dispatch_queue_create("queueA", NULL);
//    dispatch_queue_t queueB = dispatch_queue_create("queueB", NULL);
//    NSLog(@"A======%@， B=====%@",queueA, queueB);
//    dispatch_sync(queueA, ^{
//        NSLog(@"A-------%@", dispatch_get_current_queue());
//        dispatch_sync(queueB, ^{
//            NSLog(@"B-------%@", dispatch_get_current_queue());
//            //do something
//        });
//    });
//    return;
//
    __block NSInteger tickets = 50;
    // queue1 代表北京火车票售卖窗口
    dispatch_queue_t beijing = dispatch_queue_create("beijing", DISPATCH_QUEUE_SERIAL);
    // queue2 代表上海火车票售卖窗口
    dispatch_queue_t shanghai = dispatch_queue_create("shanghai", DISPATCH_QUEUE_SERIAL);
    
    dispatch_semaphore_t sm = dispatch_semaphore_create(1);
    
    dispatch_async(beijing, ^{
        while (1) {
//            long value1 = dispatch_semaphore_wait(sm, dispatch_time(DISPATCH_TIME_NOW, 0.1 * NSEC_PER_SEC));
            long value1 = dispatch_semaphore_wait(sm, DISPATCH_TIME_FOREVER);
            NSLog(@"%ld", value1);
            if (tickets > 0) {  //如果还有票，继续售卖
                tickets--;
                NSLog(@"北京卖，剩余票数：%ld 窗口：%@", (long)tickets, [NSThread currentThread]);
                [NSThread sleepForTimeInterval:0.2];
                long value2 = dispatch_semaphore_signal(sm);
                NSLog(@"%ld", value2);
            } else { //如果已卖完，关闭售票窗口
                NSLog(@"北京卖，所有火车票均已售完");
                long value2 = dispatch_semaphore_signal(sm);
                NSLog(@"%ld", value2);
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
