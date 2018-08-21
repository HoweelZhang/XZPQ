//
//  homeCollectionViewCell.m
//  XZPQ
//
//  Created by Howeel on 2018/8/21.
//  Copyright © 2018年 yhwx. All rights reserved.
//

#import "homeCollectionViewCell.h"
#import "Masonry.h"

@interface homeCollectionViewCell()

@property(nonatomic, strong) UIView *imgBox;
@property(nonatomic, strong) UIImageView *img;
@property(nonatomic, strong) UILabel *nameLab;
@property(nonatomic, strong) UILabel *priceLab;

@end

@implementation homeCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
    }
    return self;
}

- (void)setupViews {
    
    _imgBox = ({
        UIView *view = [[UIView alloc] init];
        [self addSubview:view];
        view.backgroundColor = [UIColor colorWithRed:247/255.0 green:247/255.0 blue:247/255.0 alpha:1];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.top.left.equalTo(self);
            make.height.equalTo(@(170));
        }];
        view;
    });
    
    _img = ({
        UIImageView *img = [[UIImageView alloc]initWithImage:UIImageMake(@"phone")];
        [_imgBox addSubview:img];
        [img mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.mas_equalTo(self.imgBox);
            make.size.mas_equalTo(CGSizeMake(106, 128));
        }];
        img;
    });
    
    _nameLab = ({
        UILabel *label = [[UILabel alloc] init];
        [self addSubview:label];
        label.text = @"华为P20 Pro";
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:14];
        label.textColor = [UIColor colorWithRed:51.0026/255.0 green:51.0026/255.0 blue:51.0026/255.0 alpha:1];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.imgBox.mas_bottom).offset(10);
            make.size.mas_equalTo(CGSizeMake(self.frame.size.width, 14));
        }];
        label;
    });
    
    _priceLab = ({
        UILabel *label = [[UILabel alloc] init];
        [self addSubview:label];
        label.text = @"￥200.00/月";
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:14];
        label.textColor = [UIColor colorWithRed:51.0026/255.0 green:51.0026/255.0 blue:51.0026/255.0 alpha:1];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.nameLab.mas_bottom).offset(10);
            make.size.mas_equalTo(CGSizeMake(self.frame.size.width, 14));
        }];
        label;
    });
    
}

@end
