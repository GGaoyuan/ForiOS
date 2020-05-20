//
//  NewDictionary.h
//  ForiOS
//
//  Created by 高源 on 2020/5/19.
//  Copyright © 2020 gaoyuan. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NewDictionary : NSObject

@property (nonatomic, strong) NSString *string;
@property (nonatomic, strong) NSNumber *number;
@property (nonatomic, strong) NSDate *date;
@property (nonatomic, strong) id opaqueObject;

@end

NS_ASSUME_NONNULL_END
