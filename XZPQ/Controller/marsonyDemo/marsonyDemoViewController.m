//
//  marsonyDemoViewController.m
//  XZPQ
//
//  Created by Howeel on 2018/8/22.
//  Copyright © 2018年 yhwx. All rights reserved.
//

#import "marsonyDemoViewController.h"
#import <objc/runtime.h>

@interface marsonyDemoViewController ()

@end

@implementation marsonyDemoViewController

- (void)didInitialize {
    [super didInitialize];
    // init 时做的事情请写在这里
}

- (void)initSubviews {
    [super initSubviews];
    // 对 subviews 的初始化写在这里
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    QMUILogInfo(@"viewWillAppear",@"");
}

- (void)qmuiNav_viewWillAppear:(BOOL)animated {
    QMUILogInfo(@"qmuiNav_viewWillAppear",@"");
}


- (void)willShowViewController:(nonnull UIViewController *)viewController animated:(BOOL)animated NS_REQUIRES_SUPER{
    [super navigationController:self.navigationController willShowViewController:viewController animated:animated];
    QMUILog(@"willShowViewController",@"");
}

- (void)didShowViewController:(nonnull UIViewController *)viewController animated:(BOOL)animated NS_REQUIRES_SUPER{
    QMUILog(@"didShowViewController",@"");
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // 对 self.view 的操作写在这里
    self.view.backgroundColor = UIColorWhite;
}

- (void)tap {
    QMUILog(@"",@"tap-=-=-=-=-=-=-=");
}


- (void)setupNavigationItems {
    [super setupNavigationItems];
//    self.title = @"marsonyDemo<##>";
    QMUINavigationTitleView *titleV = [[QMUINavigationTitleView alloc]initWithStyle:QMUINavigationTitleViewStyleSubTitleVertical];
    titleV.title = @"title";
    titleV.subtitle = @"subtitle";
    titleV.needsLoadingView = YES;
    titleV.loadingViewHidden = false;
    self.navigationItem.titleView = titleV;
    self.view.backgroundColor = UIColorWhite;
}



@end
