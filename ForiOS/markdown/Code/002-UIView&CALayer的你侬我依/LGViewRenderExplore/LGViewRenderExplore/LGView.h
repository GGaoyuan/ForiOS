//
//  LGView.h
//  LGViewRenderExplore
//
//  Created by vampire on 2020/3/10.
//  Copyright © 2020 LGEDU. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LGView : UIView

- (CGContextRef)createContext;

- (void)closeContext;

@end

NS_ASSUME_NONNULL_END
