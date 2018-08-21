//
//  NavigationController.m
//  XZPQ
//
//  Created by Howeel on 2018/8/16.
//  Copyright © 2018年 yhwx. All rights reserved.
//

#import "NavigationController.h"

@interface NavigationController ()

@end

@implementation NavigationController

- (void)didInitialize {
    [super didInitialize];
    // init 时做的事情请写在这里
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@""] forBarPosition:UIBarPositionTop barMetrics:UIBarMetricsDefault];
    self.navigationBar.shadowImage = [UIImage new];
}

@end
