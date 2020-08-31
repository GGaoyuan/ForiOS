//
//  DrawRectViewController.m
//  ForiOS
//
//  Created by 高源 on 2020/8/31.
//  Copyright © 2020 gaoyuan. All rights reserved.
//

#import "DrawRectViewController.h"
#import "DrawRectView.h"
@interface DrawRectViewController ()

@end

@implementation DrawRectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    DrawRectView *drawRectView = [[DrawRectView alloc] initWithFrame:CGRectMake(10, 10, [UIScreen mainScreen].bounds.size.width - 20, [UIScreen mainScreen].bounds.size.height - 20)];
    drawRectView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:drawRectView];
    
}


- (void)dealloc {
    NSLog(@"DrawRectViewController dealloc");
}

@end
