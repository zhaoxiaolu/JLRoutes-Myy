//
//  TabbarController.m
//  JLRoutes
//
//  Created by 孟遥 on 2017/3/27.
//  Copyright © 2017年 mengyao. All rights reserved.
//

#import "TabbarController.h"
#import "OneViewController.h"
#import "TwoViewController.h"
#import "ThreeViewController.h"
#import "NavigationController.h"
#import "OnePushViewController.h"
#import "JLRoutes.h"

@interface TabbarController ()

@end

@implementation TabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    OneViewController *one = [[OneViewController alloc]init];
    NavigationController *nav1 = [[NavigationController alloc]initWithRootViewController:one];
    nav1.tabBarItem.title = @"模块一";
    [self addChildViewController:nav1];
    
    TwoViewController *two = [[TwoViewController alloc]init];
    NavigationController *nav2 = [[NavigationController alloc]initWithRootViewController:two];
    nav2.tabBarItem.title = @"模块二";
    [self addChildViewController:nav2];
    
    ThreeViewController *three = [[ThreeViewController alloc]init];
    NavigationController *nav3 = [[NavigationController alloc]initWithRootViewController:three];
    nav3.tabBarItem.title = @"模块三";
    [self addChildViewController:nav3];
    
    //
    [[JLRoutes globalRoutes]addRoute:@"/:toController/:paramOne/:paramTwo/:paramThree/:paramFour" handler:^BOOL(NSDictionary<NSString *,id> * _Nonnull parameters) {
        
        Class class = NSClassFromString(parameters[@"toController"]);
        UIViewController *vc = [[class alloc]init];
        NSURL *headUrl = parameters[JLRouteURLKey];
        NSString *head = [headUrl.absoluteString componentsSeparatedByString:@"://"].firstObject;
        if ([head isEqualToString:@"JLRoutesOne"]) {
           [nav1 pushViewController:vc animated:YES];
        }else if ([head isEqualToString:@"JLRoutesTwo"]){
            [nav2 pushViewController:vc animated:YES];
        }else if([head isEqualToString:@"JLRoutesThree"]){
            [nav3 pushViewController:vc animated:YES];
        }
        
        return YES;
    }];
}


@end
