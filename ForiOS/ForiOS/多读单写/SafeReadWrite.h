//
//  SafeReadWrite.h
//  ForiOS
//
//  Created by gaoyuan on 2020/9/10.
//  Copyright © 2020 gaoyuan. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SafeReadWrite : NSObject

- (void)safeSet:(NSString *)key value:(id)value;
- (id)safeGet:(NSString *)key;

@end

NS_ASSUME_NONNULL_END
