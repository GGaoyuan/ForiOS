//
//  KTVRecordWavyStarEffect.m
//  ktv
//
//  Created by YinXuebin on 15/11/10.
//
//

#import "KTVRecordWavyStarEffect.h"

@interface KTVRecordWavyStarEffect()

@property (nonatomic, weak) UIView *wavyView;

@end

@implementation KTVRecordWavyStarEffect

- (instancetype)initWithWavyView:(UIView *)wavyView {
    self = [super init];
    if (self) {
        self.wavyView = wavyView;
    }
    return self;
}

- (void)showEffectWithPosition:(CGPoint)point {
    dispatch_async(dispatch_get_main_queue(), ^{
        NSArray<NSString *> *starImages = @[@"RecordView_Wavy_Particle_Texture0", @"RecordView_Wavy_Particle_Texture1", @"RecordView_Wavy_Particle_Texture2", @"RecordView_Wavy_Particle_Texture3"];
        for (NSInteger index = 0 ; index < 6; index++) {
            NSString *imageName = starImages[[self getRandomNumberBetween:0 to:starImages.count -1]];
            
            CALayer *starImageLayer = [[CALayer alloc] init];
            starImageLayer.masksToBounds = YES;
            starImageLayer.backgroundColor = [[UIColor clearColor] CGColor];
            starImageLayer.contents = (id)[[UIImage imageNamed:imageName] CGImage];
            starImageLayer.frame = CGRectMake(point.x, point.y, 32, 32);
            starImageLayer.opacity = 1;
            
            CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
            animation.duration = 2.0;
            animation.removedOnCompletion = NO;
            animation.fillMode = kCAFillModeForwards;
            animation.calculationMode = kCAAnimationCubicPaced;
            CGMutablePathRef curvedPath = CGPathCreateMutable();
            CGPathMoveToPoint(curvedPath, nil, point.x, point.y);
            
            NSInteger tox = 0 - (arc4random() % 100) / 100. * 128 - 64;
            NSInteger toy = [self getRandomNumberBetween:-100 to:100];
            CGPathAddLineToPoint(curvedPath, nil, tox, toy);
            animation.path = curvedPath;
            [self.wavyView.layer addSublayer:starImageLayer];
            
            CAKeyframeAnimation *alphaAnimation = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
            alphaAnimation.values = [self randomValuesForCount:10];
            alphaAnimation.duration = 2.0;
            alphaAnimation.removedOnCompletion = NO;
            alphaAnimation.fillMode = kCAFillModeForwards;
            
            CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
            scaleAnimation.fromValue = @(1.0 * (arc4random() % 100) / 100);
            scaleAnimation.toValue = @(1);
            alphaAnimation.duration = 1.0;
            alphaAnimation.removedOnCompletion = NO;
            alphaAnimation.fillMode = kCAFillModeForwards;
            
            CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
            animationGroup.fillMode = kCAFillModeForwards;
            animationGroup.duration = 2;
//            animationGroup.animations = @[animation, alphaAnimation, scaleAnimation];
            animationGroup.animations = @[animation];
            animationGroup.removedOnCompletion = NO;
            
            [CATransaction begin];
            [CATransaction setCompletionBlock:^{
                [starImageLayer removeFromSuperlayer];
            }];
            [starImageLayer addAnimation:animationGroup forKey:nil];
            [CATransaction commit];
            CGPathRelease(curvedPath);
        }
    });
}

- (NSInteger)getRandomNumberBetween:(NSInteger)from to:(NSInteger)to {
    return (NSInteger)(from + arc4random() % (to - from + 1));
}

- (NSArray *)randomValuesForCount:(NSInteger)count {
    NSMutableArray *values = [NSMutableArray array];
    for (int i = 0; i < count; i++) {
        float value = (arc4random() % 100) / 100.;
        [values addObject:@(value)];
    }
    return values;
}

@end
