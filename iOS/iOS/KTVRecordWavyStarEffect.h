//
//  KTVRecordWavyStarEffect.h
//  ktv
//
//  Created by YinXuebin on 15/11/10.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface KTVRecordWavyStarEffect : NSObject 

- (instancetype)initWithWavyView:(UIView *)wavyView;

- (void)showEffectWithPosition:(CGPoint)point;

@end
