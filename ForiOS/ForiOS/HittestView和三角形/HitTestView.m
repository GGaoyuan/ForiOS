//
//  HitTestView.m
//  ForiOS
//
//  Created by gaoyuan on 2020/9/11.
//  Copyright © 2020 gaoyuan. All rights reserved.
//

#import "HitTestView.h"

@implementation HitTestView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        HitTestButtonA *buttonA = [HitTestButtonA buttonWithType: UIButtonTypeCustom];
        [buttonA addTarget:self action:@selector(buttonAAction) forControlEvents:UIControlEventTouchUpInside];
        buttonA.backgroundColor = [UIColor redColor];
        buttonA.frame = CGRectMake(0, 0, 60, 100);
        [self addSubview:buttonA];
        
        HitTestButtonB *buttonB = [HitTestButtonB buttonWithType: UIButtonTypeCustom];
        [buttonB addTarget:self action:@selector(buttonBAction) forControlEvents:UIControlEventTouchUpInside];
        buttonB.backgroundColor = [UIColor blueColor];
        buttonB.frame = CGRectMake(40, 0, 60, 100);
        [self addSubview:buttonB];
    }
    return self;
}

- (void)buttonAAction {
    NSLog(@"HitTestView --- buttonAAction");
}
- (void)buttonBAction {
    NSLog(@"HitTestView --- buttonBAction");
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    if (point.x < 60) {
        __block HitTestButtonA *button = nil;
        [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([obj isKindOfClass:[HitTestButtonA class]]) {
                button = (HitTestButtonA *)obj;
            }
        }];
        if (button) {
            NSLog(@"HitTestView --- SuperView returnButton");
            return button;
        }
    }
    
    NSLog(@"HitTestView --- SuperView hitTesthitTesthitTest");
    return [super hitTest:point withEvent:event];
}

@end


@implementation HitTestButtonA
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    NSLog(@"HitTestView --- ButtonA hitTesthitTesthitTest");
    return [super hitTest:point withEvent:event];
}
@end

@implementation HitTestButtonB
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    NSLog(@"HitTestView --- ButtonB hitTesthitTesthitTest");
    return [super hitTest:point withEvent:event];
}
@end
