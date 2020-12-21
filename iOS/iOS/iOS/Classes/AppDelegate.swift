//
//  AppDelegate.swift
//  iOS
//
//  Created by gaoyuan on 2020/10/13.
//

import UIKit


@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        YDMemoryMonitor.monitor.startMemoryMonitor()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let homeViewController = HomeViewController()
        window?.rootViewController = homeViewController
        window?.makeKeyAndVisible()
        
//        self.window = [[KTVUIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//        self.window.backgroundColor = UIColorFromRGB(KTVBackgroundColorGray);
//        KTVHomePageViewController *homePageViewController = [[KTVHomePageViewController alloc] initWithNibName:@"KTVHomePageViewController" bundle:nil];
//        if (launchOptions || [KTVPasteBoardRecognizer canRecognize]) {
//            homePageViewController.shouldNotUseDefaultPage = YES;
//        }
//
//        self.window.rootViewController = homePageViewController;
//        [self.window makeKeyAndVisible];
        return true
    }

}

