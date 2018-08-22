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
    self.navigationController.navigationBar.topItem.title = @"marsonyDemo<##>";
}

- (void)initSubviews {
    [super initSubviews];
    // 对 subviews 的初始化写在这里
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    QMUINavigationButton *navBtn = [[QMUINavigationButton alloc]initWithType:QMUINavigationButtonTypeBack title:@"返回"];
//    self.navigationItem = navBtn;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // 对 self.view 的操作写在这里
//    [self showEmptyViewWithImage:UIImageMake(@"phone") text:@"text" detailText:@"detailText" buttonTitle:@"button" buttonAction:@selector(tap)];
}
- (void)tap {
    QMUILog(@"",@"tap-=-=-=-=-=-=-=");
}


- (void)setupNavigationItems {
    [super setupNavigationItems];
//    self.title = @"marsonyDemo<##>";
//    QMUINavigationTitleView *titleV = [[QMUINavigationTitleView alloc]init];
//    titleV.style = QMUINavigationTitleViewStyleSubTitleVertical;
//    titleV.title = @"title";
//    titleV.subtitle = @"subtitle";
//    self.navigationItem.titleView = titleV;
    self.view.backgroundColor = UIColorWhite;
}



@end
