//
//  homeViewController.m
//  XZPQ
//
//  Created by Howeel on 2018/8/15.
//  Copyright © 2018年 yhwx. All rights reserved.
//

#import "homeViewController.h"
#import "homeView.h"
#import "Masonry.h"
#import "marsonyDemoViewController.h"

static NSString* const ktableCell = @"tableCell";

@interface homeViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, strong) UITableViewCell *cell;
@property(nonatomic, copy) NSArray *arr;
@property(nonatomic, assign) NSInteger age;

@end

@implementation homeViewController

- (void)didInitialize {
    [super didInitialize];
    // init 时做的事情请写在这里
}

- (void)initSubviews {
    [super initSubviews];
    // 对 subviews 的初始化写在这里
    self.view.backgroundColor = [UIColor whiteColor];
//    [self setupHomeViews];
    _arr = @[@"marsonyDemo"];
    [self setupViews];
    
//    NSMutableArray *arr = @[{@"name":@"masronyDemo"}];
}

// tabbleView
- (void)setupViews {
    
    _tableView = ({
        
        UITableView *tableView = [UITableView new];
        tableView.backgroundColor = UIColorRed;
        [self.view addSubview:tableView];
        tableView.delegate = self;
        tableView.dataSource = self;
        [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(self.view);
        }];
        
        tableView;
    });
}

// 小猪佩奇的首页
- (void)setupHomeViews {
    homeView *view = [homeView new];
    [self.view addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(knavBarWithStatusBar_height, 0, 64, 0));
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 对 self.view 的操作写在这里
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
//    self.title = @"UIKit";
//    self.tabBarItem.title = @"UIKit";
//    self.view.backgroundColor = [UIColor colorWithRed:247/255.0 green:247/255.0 blue:247/255.0 alpha:1];
}

- (void)setupNavigationItems {
    [super setupNavigationItems];
    self.title = @"UIkit";
}

#pragma mark - UITableViewDataSorce

//@requierd

// 一个section有多少row
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
   
    return  self.arr.count;
}


// 单元格视图
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId"];
    
    if (nil == cell) {
       
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellId"];
        cell.textLabel.text = self.arr[indexPath.row];
        cell.detailTextLabel.text = [NSString stringWithFormat:@"detail%@",@(indexPath.row)];
 
        QMUILog(@"cell",@"indexPath:%@",indexPath);
    }
    
    return cell;
}

//@optional
// 一个section有3个单元格 Default is 1 if not implemented
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

// 设置header的title fixed font style. use custom view (UILabel) if you want something different
- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    NSString *str = [NSString stringWithFormat:@"header -- %ld",section];
    return str;
}
// 设置footer的title
- (nullable NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    
    NSString *str = [NSString stringWithFormat:@"footer -- %ld",section];
    return str;
}


// Editing
// Individual rows can opt out of having the -editing property set for them. If not implemented, all rows are assumed to be editable.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return YES;
}

// Index
// return list of section titles to display in section index view (e.g. "ABCD...Z#")
- (nullable NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    
    NSArray *arr = @[@"A",@"b",@"c",@"d",@"e",@"f",@"g",@"h",@"i",@"j",@"k"];
    return arr;
}

// tell table which section corresponds to section title/index (e.g. "B",1))
- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index{
    
    QMUILog(@"",@"--title:%@--index:%ld--",title,index);
    return index;
}

// Data manipulation - insert and delete support

// After a row has the minus or plus button invoked (based on the UITableViewCellEditingStyle for the cell), the dataSource must commit the change
// Not called for edit actions using UITableViewRowAction - the action's handler will be invoked instead
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    QMUILog(@"insert and delete",@"--%ld--%@--",editingStyle,indexPath);
}

// Moving/reordering

// Allows the reorder accessory view to optionally be shown for a particular row. By default, the reorder control will be shown only if the datasource implements -tableView:moveRowAtIndexPath:toIndexPath:
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return YES;
}

// Data manipulation - reorder / moving support

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
    
    QMUILog(@" reorder / moving",@"--%@--%@--",sourceIndexPath,destinationIndexPath);
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    QMUILog(@"didSelect-选中",@"%@,%@",@(indexPath.row),cell.textLabel.text);
    
    
    [self.navigationController pushViewController:[marsonyDemoViewController new] animated:YES];
}

@end
