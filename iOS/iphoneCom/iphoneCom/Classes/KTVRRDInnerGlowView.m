//
//  KTVRRDInnerGlowView.m
//  iphoneCom
//
//  Created by gaoyuan on 2021/1/15.
//

#import "KTVRRDInnerGlowView.h"
#import "TestLayer.h"
@interface KTVRRDInnerGlowView()

@property (nonatomic, assign) CGFloat radius;
@property (nonatomic, strong) UIColor *themeColor;

@property (nonatomic, strong) TestLayer *testLayer;

@end

@implementation KTVRRDInnerGlowView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = NO;
        self.backgroundColor = [UIColor clearColor];
        self.radius = 50;
        self.themeColor = [UIColor redColor];
        
    }
    return self;
}

//- (void)layoutSubviews {
//    [super layoutSubviews];
//
//
//    CGPathRef path = CGPathCreateWithRect(self.bounds, nil);
//    CGMutablePathRef outer = CGPathCreateMutable();
//    CGPathAddRect(outer, nil, CGRectInset(self.bounds, -self.bounds.size.width, -self.bounds.size.height));
//    CGPathAddPath(outer, nil, path);
//    CGPathCloseSubpath(outer);
//
//    self.layer.shadowPath = outer;
//    self.layer.shadowColor = self.themeColor.CGColor;
//    self.layer.shadowRadius = self.radius * 0.2;
//    self.layer.shadowOffset = CGSizeZero;
//    self.layer.shadowOpacity = 1.0;
//}

    
//- (void)drawRect:(CGRect)rect {
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    CGContextSetBlendMode(context, kCGBlendModeDifference);
//    [self.testLayer drawInContext:context];
//}
    
//
//
- (void)drawRect:(CGRect)rect {
    
    CGContextRef context = UIGraphicsGetCurrentContext();

    CGPathRef path = CGPathCreateWithRect(self.bounds, nil);

    CGContextClearRect(context, self.bounds);
    CGContextAddPath(context, path);
    CGContextClip(context);

    CGMutablePathRef outer = CGPathCreateMutable();
    CGPathAddRect(outer, nil, CGRectInset(self.bounds, -self.bounds.size.width, -self.bounds.size.height));
    CGPathAddPath(outer, nil, path);
    CGPathCloseSubpath(outer);

    CGContextAddPath(context, outer);

    CGContextSetShadowWithColor(context, CGSizeZero, self.radius, self.themeColor.CGColor);
    CGContextDrawPath(context, kCGPathEOFillStroke);
}
//
//    - (void)animationStart {
//
//    }
//
//    - (void)gradientStart {
//
//    }
//
//    - (void)gradientEnd {
//
//    }

    
@end
