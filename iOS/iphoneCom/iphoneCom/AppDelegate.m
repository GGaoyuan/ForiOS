//
//  AppDelegate.m
//  iphoneCom
//
//  Created by gaoyuan on 2020/12/21.
//

#import "AppDelegate.h"
#import "iphoneCom-Swift.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    HomeViewController *homeViewController = [[HomeViewController alloc] init];
    self.window.rootViewController = homeViewController;
    [self.window makeKeyAndVisible];
    return YES;
}


@end
