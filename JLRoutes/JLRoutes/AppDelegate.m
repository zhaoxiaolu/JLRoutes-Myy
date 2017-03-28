//
//  AppDelegate.m
//  JLRoutes
//
//  Created by 孟遥 on 2017/3/27.
//  Copyright © 2017年 mengyao. All rights reserved.
//

#import "AppDelegate.h"
#import "NavigationController.h"
#import "TabbarController.h"
#import "OnePushViewController.h"
#import "JLRoutes.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    TabbarController *tabbarController = [[TabbarController alloc]init];
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = tabbarController;
    [self.window makeKeyAndVisible];
    
    return YES;
}


- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options
{
    return [[JLRoutes globalRoutes]routeURL:url];;
}



@end
