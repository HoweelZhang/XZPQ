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

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    [super pushViewController:viewController animated:animated];
    QMUILog(@"pushViewController",@"%@",viewController);
}

/**
 
 ****UInavigationController = 管理当前的UIViewController堆栈 + UINavigationBar管理 + UIToolbar + delegate****
 
 ***管理当前的UIViewController堆栈：
 
 * 参数一: UIViewController, 该参数不可以使用UITabBarController的实例
 * 参数二: 是否执行动画
 - (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated;
 
 * 参数一: 是否执行动画
 * 返回值: 从UIViewController堆栈中Pop出来的UIViewController
 - (UIViewController *)popViewControllerAnimated:(BOOL)animated;
 
 * 参数一: 是否执行动画
 * 返回值: 从UIViewController堆栈中Pop出来的UIViewController数组
 - (NSArray<__kindof UIViewController *> *)popToRootViewControllerAnimated:(BOOL)animated;
 
 * 参数一: 指定UIViewController, 该UIViewController必须位于当前UIViewController堆栈中
 * 参数二: 是否执行动画
 * 返回值: 从UIViewController堆栈中Pop出来的UIViewController数组
 - (NSArray<__kindof UIViewController *> *)popToViewController:(UIViewController *)viewController animated:(BOOL)animated;

 * 参数一: UIViewController, 该参数不可以使用UITabBarController的实例
 * 参数二: 要求展示UIViewController的对象
 - (void)showViewController:(UIViewController *)vc sender:(id)sender; NS_AVAILABLE_IOS(8_0)
 
 
 ***UINavigationBar创建、配置及管理：
 
 1.通过 viewControllers栈顶的navigationItem属性 (该属性位于UIViewController的UINavigationControllerItem类目中)
 管理 UINavigationBar展示的内容，
 
 2.通过UINavigationController的navigationBar属性管理UINavigationBar（UINavigationController是UINavigationBar的delegate其负责响应该UINavigationBarDelegate的代理方法, 并据此更新位于界面中间部分的UIViewController的视图）
 
 2.1.设置外观
 eg：navigationController.navigationBar.barStyle = UIBarStyleDefault;
 2.2.隐藏状态
 eg：navigationController.navigationBarHidden = YES; 或者 [navigationController setNavigationBarHidden:YES animated:YES];
 
 手势识别器的管理
 
 // 侧滑返回手势识别器
 @property(nonatomic, readonly) UIGestureRecognizer *interactivePopGestureRecognizer;
 // 用于轻拍隐藏UINavigationBar与UIToolbar的手势识别器
 @property(nonatomic, readonly, assign) UITapGestureRecognizer *barHideOnTapGestureRecognizer;
 // 用于轻扫隐藏UINavigationBar与UIToolbar的手势识别器
 @property(nonatomic, readonly, strong) UIPanGestureRecognizer *barHideOnSwipeGestureRecognizer;
 
 eg：UIGestureRecognizer *interactivePopGestureRecognizer = navigationController.interactivePopGestureRecognizer;
 注: 默认情况下, 用户的一个操作只能被一个UIGestureRecognizer(手势识别器)识别, 系统将该手势识别器提供给开发者以便在gestureRecognizer:shouldRecognizeSimultaneouslyWithGestureRecognizer:代理方法中设置允许其他手势识别器与该手势识别器同时被识别

 通过手势隐藏UINavigationBar与UIToolbar
 
 // 轻拍隐藏、再次轻拍显示
 @property(nonatomic, readwrite, assign) BOOL hidesBarsOnTap;
 // 向上轻扫隐藏、向下轻扫显示
 @property(nonatomic, readwrite, assign) BOOL hidesBarsOnSwipe;
 // 横屏隐藏(此时轻拍显示)、竖屏显示
 @property(nonatomic, readwrite, assign) BOOL hidesBarsWhenVerticallyCompact;
 // 键盘出现隐藏、键盘消失保持隐藏(此时轻拍显示)
 @property(nonatomic, readwrite, assign) BOOL hidesBarsWhenKeyboardAppears;
 // 示例
 navigationController.hidesBarsOnTap = YES;
 注: 该属性自iOS8开始生效
 
 ***UINavigationBar堆栈管理UINavigationItem***
 UINavigationBar = UINavigationItems; 系统默认：UINavigationBar = topItem（栈顶的UINavigationItem） + backItem（栈底的UINavigationItem）;
 
 管理UINavigationItem堆栈
 
 方式1
 * 参数一: UINavigationItem
 * 参数二: 是否执行动画
- (void)pushNavigationItem:(UINavigationItem *)item animated:(BOOL)animated;
eg：
UINavigationItem *navigationItem = [[UINavigationItem alloc] initWithTitle:@"Owen"];
[navigationBar pushNavigationItem:navigationItem animated:YES];

 * 参数一: 是否执行动画
 * 返回值: 从UINavigationItem堆栈中Pop出来的UINavigationItem

- (UINavigationItem *)popNavigationItemAnimated:(BOOL)animated;
eg：
//UINavigationItem *navigationItem = [navigationBar popNavigationItemAnimated:YES];

 方式2
 @property(nonatomic, copy) NSArray<UINavigationItem *> *items;
 eg：
 navigationBar.items = @[navigationItem1, navigationItem2, navigationItem3];
 或者
 * 参数一: UINavigationItem数组
 * 参数二: 是否执行动画
 
- (void)setItems:(NSArray<UINavigationItem *> *)items animated:(BOOL)animated;
eg：
[navigationBar setItems:@[navigationItem1, navigationItem2, navigationItem3] animated:YES];

 ToolBar创建、配置及管理
 */

@end
