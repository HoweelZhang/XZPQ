//
//  JKTabBarViewController.m
//  XZPQ
//
//  Created by Howeel on 2018/8/24.
//  Copyright © 2018年 yhwx. All rights reserved.
//

#import "JKTabBarViewController.h"

@interface JKTabBarViewController ()

@end

@implementation JKTabBarViewController

- (void)didInitialize {
    [super didInitialize];
    // init 时做的事情请写在这里
}

#if DEBUG
-(NSString *)description{
    NSString *surperDescription = [super description];
    NSString *logString = [NSString stringWithFormat:surperDescription,@"中间层JKTabBarViewController"];
    return logString;
}
#endif

@end
