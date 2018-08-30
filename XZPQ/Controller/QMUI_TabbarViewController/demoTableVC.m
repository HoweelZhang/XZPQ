//
//  demoTableVC.m
//  XZPQ
//
//  Created by Howeel on 2018/8/28.
//  Copyright © 2018年 yhwx. All rights reserved.
//

#import "demoTableVC.h"
#import "demoTableViewCell.h"

@interface demoTableVC ()

@property(nonatomic, strong) QMUIOrderedDictionary *dataSource;

@end

@implementation demoTableVC

- (void)didInitializeWithStyle:(UITableViewStyle)style {
    [super didInitializeWithStyle:style];
    // init 时做的事情请写在这里
}

- (void)initTableView {
    [super initTableView];
    // 对 self.tableView 的操作写在这里
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLineEtched;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 对 self.view 的操作写在这里
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
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
    self.title = @"qmuiTableDemo";
}

#pragma mark - <QMUITableViewDataSource, QMUITableViewDelegate>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return @"普通 cell";
    } else if (section == 1) {
        return @"使用 imageEdgeInsets";
    } else if (section == 2) {
        return @"使用 textLabelEdgeInsets";
    } else if (section == 3) {
        return @"使用 detailTextLabelEdgeInsets";
    } else if (section == 4) {
        return @"使用 accessoryEdgeInsets";
    }
    return nil;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    demoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[demoTableViewCell alloc] initForTableView:tableView withReuseIdentifier:@"cell"];
    }
    
    // reset
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    

    [cell updateCellAppearanceWithIndexPath:indexPath];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

@end
