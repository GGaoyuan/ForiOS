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
