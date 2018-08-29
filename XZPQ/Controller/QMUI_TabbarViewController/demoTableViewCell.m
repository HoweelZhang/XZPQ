//
//  demoTableViewCell.m
//  XZPQ
//
//  Created by Howeel on 2018/8/29.
//  Copyright © 2018年 yhwx. All rights reserved.
//

#import "demoTableViewCell.h"
#import "Masonry.h"

@implementation demoTableViewCell

- (void)didInitializeWithStyle:(UITableViewCellStyle)style {
    [super didInitializeWithStyle:style];
    // init 时做的事情请写在这里
}

- (void)updateCellAppearanceWithIndexPath:(NSIndexPath *)indexPath {
    [super updateCellAppearanceWithIndexPath:indexPath];
    // 每次 cellForRow 时都要做的事情请写在这里
}

- (void)layoutSubviews {
    [super layoutSubviews];
}

- (void)setupViews {
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor qmui_randomColor];
    view.frame = CGRectFlatMake(0, 0, self.qmui_width, self.qmui_height);
    [self addSubview:view];
}

@end
