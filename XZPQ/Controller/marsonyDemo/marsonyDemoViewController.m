//
//  marsonyDemoViewController.m
//  XZPQ
//
//  Created by Howeel on 2018/8/22.
//  Copyright © 2018年 yhwx. All rights reserved.
//

#import "marsonyDemoViewController.h"

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

- (void)viewDidLoad {
    [super viewDidLoad];
    // 对 self.view 的操作写在这里
//    [self showEmptyViewWithImage:UIImageMake(@"phone") text:@"text" detailText:@"detailText" buttonTitle:@"button" buttonAction:@selector(tap)];
}
- (void)tap {
    QMUILog(@"",@"tap-=-=-=-=-=-=-=");
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.view.backgroundColor = UIColorWhite;
    self.title = @"marsony";
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
}

- (void)setupNavigationItems {
    [super setupNavigationItems];
    self.title = @"<##>";
}

@end
