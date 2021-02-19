//
//  KTVRRDThemeStorageTool.h
//  iphoneCom
//
//  Created by gaoyuan on 2021/2/2.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface KTVRRDThemeStorageThemeVersion : NSObject

@property (nonatomic, assign) NSInteger themeId;
@property (nonatomic, assign) double version;

@end

@interface KTVRRDThemeStorageTool : NSObject

+ (instancetype)sharedInstance;

- (NSArray *)fetchThemeVersions;

@end

NS_ASSUME_NONNULL_END
