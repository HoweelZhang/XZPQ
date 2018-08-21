//
//  TabBarViewController.m
//  XZPQ
//
//  Created by Howeel on 2018/8/16.
//  Copyright © 2018年 yhwx. All rights reserved.
//

#import "TabBarViewController.h"
#import "NavigationController.h"
#import "homeViewController.h"
#import "mineViewController.h"

@interface TabBarViewController ()

@end

@implementation TabBarViewController

- (void)didInitialize {
    [super didInitialize];
    // init 时做的事情请写在这里
    [self setupViewControllers];
}

- (void)setupViewControllers {
    //b.创建子控制器
    homeViewController *c1=[[homeViewController alloc]init];
    c1.tabBarItem.title=@"租赁";
    c1.tabBarItem.image=[UIImage imageNamed:@"tabBar_essence_icon"];
    c1.tabBarItem.selectedImage=[UIImage imageNamed:@"tabBar_essence_click_icon"];
    NavigationController *c1Nva = [[NavigationController alloc]initWithRootViewController:c1];
    
    
    QMUICommonViewController *c4=[[QMUICommonViewController alloc]init];
    c4.tabBarItem.title=@"我的";
    c1.tabBarItem.badgeValue=@"1";
    c4.tabBarItem.image=[UIImage imageNamed:@"tabBar_new_icon"];
    c4.tabBarItem.selectedImage=[UIImage imageNamed:@"tabBar_new_click_icon"];
    NavigationController *c4Nva = [[NavigationController alloc]initWithRootViewController:c4];
    
    //c.添加子控制器到ITabBarController中
    //c.1第一种方式
    //    [tb addChildViewController:c1];
    //    [tb addChildViewController:c2];
    //c.2第二种方式
    self.viewControllers=@[c1Nva,c4Nva];
}

@end
