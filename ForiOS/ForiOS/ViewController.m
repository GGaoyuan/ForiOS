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

@property (nonatomic, strong) KVOObject *kvoObj;
@property (nonatomic, copy) NSMutableArray *array;
@end

@implementation ViewController

- (void)btnAction {
    NSLog(@"%@", self.kvoObj.name);
    self.kvoObj.name = @"111";
}

- (void)btn2Action {
    [self.kvoObj willChangeValueForKey:@"name"];
    [self.kvoObj didChangeValueForKey:@"name"];
    
}

- (void)test {
    for(int i = 0; i < 100000; i++) {
        if (i == 99999) {
            NSLog(@"2");
        }
    }
    self.array = [NSMutableArray array];
    [self.array addObject:@"1"];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    self.array = [NSMutableArray array];
//    [self.array addObject:@"1"];
    
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        NSLog(@"current --- %@", [NSRunLoop currentRunLoop]);
        
        @autoreleasepool {
            NSLog(@"autorelease current --- %@", [NSRunLoop currentRunLoop]);
        }
        
        NSLog(@"main --- %@", [NSRunLoop mainRunLoop]);
    });
    
    
    
//    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        for(int i = 0; i < 100000; i++) {
            if (i == 99999) {
                NSLog(@"1");
            }
        }
        
//        [self performSelector:@selector(test) withObject:nil afterDelay:0];
//        [self test];
        
        for(int i = 0; i < 100000; i++) {
            if (i == 99999) {
                NSLog(@"3");
            }
        }
        for(int i = 0; i < 100000; i++) {
            if (i == 99999) {
                NSLog(@"4");
            }
        }
    });
    NSLog(@"------------------");
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
            for(int i = 0; i < 100000; i++) {
                if (i == 99999) {
                    NSLog(@"11");
                }
            }
            
    //        [self performSelector:@selector(test) withObject:nil afterDelay:0];
//            [self test];
            
            for(int i = 0; i < 100000; i++) {
                if (i == 99999) {
                    NSLog(@"33");
                }
            }
            for(int i = 0; i < 100000; i++) {
                if (i == 99999) {
                    NSLog(@"44");
                }
            }
        });
}

- (void)viewDidLoad {
    [super viewDidLoad];

    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
    btn.frame = CGRectMake(100, 100, 100, 100);
    [self.view addSubview:btn];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn2.backgroundColor = [UIColor blueColor];
    [btn2 addTarget:self action:@selector(btn2Action) forControlEvents:UIControlEventTouchUpInside];
    btn2.frame = CGRectMake(100, 200, 100, 100);
    [self.view addSubview:btn2];
    
    SwiftMain *main = [SwiftMain new];
    [main webImageWithVc:self];
    
    self.kvoObj = [[KVOObject alloc] init];
    self.kvoObj.name = @"aaaa";
    [self.kvoObj addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionOld|NSKeyValueObservingOptionNew context:nil];
    
//    [self languegeTest];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"name"] && [object isEqual:self.kvoObj]) {
        NSLog(@"observeValueForKeyPath --- %@", self.kvoObj.name);
    }
}

- (void)readMethod {
    
}

- (void)writeMethod {
    
}


- (void)languegeTest {
    //    西班牙语、阿拉伯语、法语、俄语、日语、汉语拼音、意大利语、海地语、印第安语
    NSArray *testArray = @[@"Señor", @" العسل الحلو",
                           @"Je suis un mot très compliqué.",
                           @"Я очень сложное слово",
                           @"私は超複雑な言葉です。",
                           @"Sono un detto super complesso",
                           @"Mwen se yon konplèks ki di",
                           @"मैं एक सुपर जटिल कह रहा हूँ",];
    CGFloat height = 100;
    for (int i = 0; i < testArray.count; i++) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, i * height, [UIScreen mainScreen].bounds.size.width, height)];
        label.text = testArray[i];
        label.backgroundColor = [UIColor yellowColor];
        [self.view addSubview:label];
    }
}

@end
