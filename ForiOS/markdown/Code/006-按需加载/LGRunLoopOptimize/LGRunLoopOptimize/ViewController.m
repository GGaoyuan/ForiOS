//
//  ViewController.m
//  LGRunLoopOptimize
//
//  Created by vampire on 2019/11/23.
//  Copyright © 2019 LGEDU. All rights reserved.
//

#import "ViewController.h"
#import <AFNetworking/UIKit+AFNetworking.h>

typedef void(^RunloopBlock)(void);

static NSString * IDENTIFIER = @"IDENTIFIER";
static CGFloat CELL_HEIGHT = 135.f;

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong) NSMutableArray * taskes;

@property(nonatomic,assign) NSUInteger  maxQueueLength;

@property (nonatomic, strong) UITableView *exampleTableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //注册Cell
    [self.exampleTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:IDENTIFIER];
    
    _maxQueueLength = 60;
    _taskes = [NSMutableArray array];
    
    [NSTimer scheduledTimerWithTimeInterval:0.0001 target:self selector:@selector(timerMethod) userInfo:nil repeats:YES];
    
    //添加观察者
    [self addRunloopObserver];
   
}

- (void)timerMethod{
    
}


//MARK: 内部实现方法

//添加文字
+(void)addlabel:(UITableViewCell *)cell indexPath:(NSIndexPath *)indexPath{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, 300, 25)];
    label.backgroundColor = [UIColor clearColor];
    label.textColor = [UIColor redColor];
    label.text = [NSString stringWithFormat:@"%zd", indexPath.row];
    label.font = [UIFont boldSystemFontOfSize:13];
    label.tag = 4;
    [cell.contentView addSubview:label];
//
//    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(5, 99, 300, 35)];
//    label1.lineBreakMode = NSLineBreakByWordWrapping;
//    label1.numberOfLines = 0;
//    label1.backgroundColor = [UIColor clearColor];
//    label1.textColor = [UIColor colorWithRed:0 green:100.f/255.f blue:0 alpha:1];
//    label1.text = [NSString stringWithFormat:@"%zd - Drawing large image is low priority. Should be distributed into different run loop passes.", indexPath.row];
//    label1.font = [UIFont boldSystemFontOfSize:13];
//    label1.tag = 5;
//    [cell.contentView addSubview:label1];

}


//加载第一张
+(void)addImage1With:(UITableViewCell *)cell{
    //第一张
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 30, 85, 85)];
    imageView.tag = 1;
   
//    NSString *path1 = [[NSBundle mainBundle] pathForResource:@"v4" ofType:@"jpg"];
//    UIImage *image = [UIImage imageWithContentsOfFile:path1];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    [imageView setImageWithURL:[NSURL URLWithString:@"http://10.url.cn/qqcourse_logo_ng/ajNVdqHZLLAGibbjkzGt0bXTwJj4iczWic3bNkrByDkblCl3GoHib0UfNzTfQkNSKt6QDaKLsPdLsPU/600"]];
    [UIView transitionWithView:cell.contentView duration:0.3 options:(UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionTransitionCrossDissolve) animations:^{
        [cell.contentView addSubview:imageView];
    } completion:nil];
}


//加载第二张
+(void)addImage2With:(UITableViewCell *)cell{
    //第二张
    UIImageView *imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(105, 30, 85, 85)];
    imageView1.tag = 2;
//    NSString *path1 = [[NSBundle mainBundle] pathForResource:@"v4" ofType:@"jpg"];
//    UIImage *image1 = [UIImage imageWithContentsOfFile:path1];
    imageView1.contentMode = UIViewContentModeScaleAspectFit;
//    imageView1.image = image1;
     [imageView1 setImageWithURL:[NSURL URLWithString:@"https://10.url.cn/qqcourse_logo_ng/ajNVdqHZLLBO0GdFmfrQ2dTg4yI8KnB7ia17lmFvPj1K1X9QgnQyYKy8CU1t5NVrtrygdSLyKAEw/600"]];
    [UIView transitionWithView:cell.contentView duration:0.3 options:(UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionTransitionCrossDissolve) animations:^{
        [cell.contentView addSubview:imageView1];
    } completion:nil];
}

//加载第三张
+(void)addImage3With:(UITableViewCell *)cell{
    //第三张
    UIImageView *imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(200, 30, 85, 85)];
    imageView2.tag = 3;
//    NSString *path1 = [[NSBundle mainBundle] pathForResource:@"v4" ofType:@"jpg"];
//    UIImage *image2 = [UIImage imageWithContentsOfFile:path1];
    imageView2.contentMode = UIViewContentModeScaleAspectFit;
//    imageView2.image = image2;
     [imageView2 setImageWithURL:[NSURL URLWithString:@"https://10.url.cn/qqcourse_logo_ng/ajNVdqHZLLCHXEKBd9H0NIq5M5wwjp56F9zHHjaeFRajV182o1aUUMnRQrfBp16lWicWqco4Msjs/600"]];
    [UIView transitionWithView:cell.contentView duration:0.3 options:(UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionTransitionCrossDissolve) animations:^{
        [cell.contentView addSubview:imageView2];
    } completion:nil];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.exampleTableView.frame = self.view.bounds;
}

- (void)loadView {
    self.view = [UIView new];
    self.exampleTableView = [UITableView new];
    self.exampleTableView.delegate = self;
    self.exampleTableView.dataSource = self;
    [self.view addSubview:self.exampleTableView];
}

#pragma mark -- UITableViewDataSource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return CELL_HEIGHT;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 50;
}

static int indexb = 0;

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:IDENTIFIER];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    NSLog(@"cell -- %d%@",indexb++,cell);
    
//    for (NSInteger i = 1; i <= 5; i++) {
//        [[cell.contentView viewWithTag:i] removeFromSuperview];
//    }

//    [ViewController addlabel:cell indexPath:indexPath];
    
//    [ViewController addImage1With:cell];
//    [ViewController addImage2With:cell];
//    [ViewController addImage3With:cell];
    
    //添加图片 -- 耗时操作!!
    [self addTask:^{
        [ViewController addImage1With:cell];
    }];
    [self addTask:^{
        [ViewController addImage2With:cell];

    }];[self addTask:^{
        [ViewController addImage3With:cell];
    }];
    return cell;
}



#pragma mark -

static int indexa = 0;
-(void)addTask:(RunloopBlock)task{
    [self.taskes addObject:task];
    NSLog(@"addTask:--%d",indexa++);
    
    if (self.taskes.count > self.maxQueueLength) {
        [self.taskes removeObjectAtIndex:0];
    }
}

//添加观察者!!
-(void)addRunloopObserver{
    //获取runloop
    CFRunLoopRef runloop = CFRunLoopGetCurrent();
    //定义观察者
    static CFRunLoopObserverRef defaultModeObserver;
    //创建上下文
    CFRunLoopObserverContext context = {
        0,
        (__bridge void *)(self),
        &CFRetain,
        &CFRelease,
        NULL
    };
    //创建
    defaultModeObserver = CFRunLoopObserverCreate(NULL, kCFRunLoopBeforeWaiting, YES, 0, &Callback, &context);
    //添加到当前Runloop中
    CFRunLoopAddObserver(runloop, defaultModeObserver, kCFRunLoopCommonModes);
    
}

//回调
static void Callback(CFRunLoopObserverRef observer, CFRunLoopActivity activity, void *info){
    //取出任务执行!!
    ViewController * vc = (__bridge ViewController *)info;
    if (vc.taskes.count == 0) {
        return;
    }
    RunloopBlock task = vc.taskes.firstObject;
    task();
    [vc.taskes removeObjectAtIndex:0];
    
}


@end
