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
//    static uint64_t N;  // Counter for the guards.
//    if (start == stop || *start) return;  // Initialize only once.
//    printf("INIT: %p %p\n", start, stop);
//    for (uint32_t *x = start; x < stop; x++)
//        *x = ++N;  // Guards should start from 1.
}

void __sanitizer_cov_trace_pc_guard(uint32_t *guard) {
//    if (!*guard) return;  // Duplicate the guard check.
//    void *PC = __builtin_return_address(0); //PC就是指向各个函数调用完__sanitizer_cov_trace_pc_guard之后的下一行代码的内存地址
//    Dl_info info;
//    dladdr(PC, &info);
//    printf("fname=%s \nfbase=%p \nsname=%s\nsaddr=%p \n",info.dli_fname,info.dli_fbase,info.dli_sname,info.dli_saddr);
//    char PcDescr[1024];
//    printf("guard: %p %x PC %s\n", guard, *guard, PcDescr);
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
    [self semaphoreQuestion];
//    [self drawRectQuestion];
}

#pragma mark - DrawRect内存暴增
- (void)drawRectQuestion {
    DrawRectViewController *vc = [DrawRectViewController new];
    [self presentViewController:vc animated:true completion:nil];
}


#pragma mark - 卡顿监控Ping主线程
- (void)fpsPingQuestion {
    dispatch_semaphore_t sm2 = dispatch_semaphore_create(1);
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        while (1) {
            long value1 = dispatch_semaphore_wait(sm2, dispatch_time(DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC));
            NSLog(@"111");
        }
    });
}


#pragma mark - 信号量
- (void)semaphoreQuestion {
    __block NSInteger tickets = 50;
    // queue1 代表北京火车票售卖窗口
    dispatch_queue_t beijing = dispatch_queue_create("beijing", DISPATCH_QUEUE_SERIAL);
    // queue2 代表上海火车票售卖窗口
    dispatch_queue_t shanghai = dispatch_queue_create("shanghai", DISPATCH_QUEUE_SERIAL);
    
    dispatch_semaphore_t sm = dispatch_semaphore_create(1);
    
    dispatch_async(beijing, ^{
        while (1) {
            long value1 = dispatch_semaphore_wait(sm, dispatch_time(DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC));
            NSLog(@"%ld", value1);
//            long value1 = dispatch_semaphore_wait(sm, DISPATCH_TIME_FOREVER);
            if (tickets > 0) {  //如果还有票，继续售卖
                tickets--;
                NSLog(@"北京卖，剩余票数：%ld 窗口：%@", (long)tickets, [NSThread currentThread]);
                [NSThread sleepForTimeInterval:2];
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
            long value1 = dispatch_semaphore_wait(sm, dispatch_time(DISPATCH_TIME_NOW, 2 * NSEC_PER_SEC));
//            dispatch_semaphore_wait(sm, DISPATCH_TIME_FOREVER);
            if (tickets > 0) {  //如果还有票，继续售卖
                tickets--;
                NSLog(@"上海卖，剩余票数：%ld 窗口：%@", (long)tickets, [NSThread currentThread]);
                [NSThread sleepForTimeInterval:2];
                dispatch_semaphore_signal(sm);
            } else { //如果已卖完，关闭售票窗口
                NSLog(@"北京卖，所有火车票均已售完");
                dispatch_semaphore_signal(sm);
                break;
            }
        }
    });
}


#pragma mark - NSMutableArray的MutableCopy
- (void)mutableArrayCopy {
    NSMutableArray *test1 = [NSMutableArray arrayWithArray:@[[NSObject new], [NSObject new], [NSObject new]]];
    NSMutableArray *test2 = test1.mutableCopy;
    [test1 removeLastObject];
    NSLog(@"%@", test2);
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
    
    void (^blk)(void) = ^{
        printf("val=");
    };
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(10, 10, 80, 80)];
    view2.backgroundColor = [UIColor blueColor];
    view2.bounds = CGRectMake(10, 10, 90, 90);
    [view addSubview:view2];
    
    
    KVOObject *obj1 = [KVOObject new];
    
    id obj2 = [KVOObject class];
    void *obj = &obj2;
    [(__bridge id)obj say];
    
    [self mutableArrayCopy];
//    [self addBtn];
    
    
    
//    NewDictionary *dic = [NewDictionary new];
//    if ([dic isKindOfClass:[NSObject class]]) {
//        NSLog(@"");
//    } else {
//        NSLog(@"");
//    }
    
    
//    SwiftMain *swiftMain = [SwiftMain new];
//    [swiftMain enter];
//    return;
    
//    [ThreadTest test];
//    return;
    
    [AlgEntrance start];
//    [AlgStart start];
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

@end
