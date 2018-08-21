//
//  homeView.m
//  XZPQ
//
//  Created by Howeel on 2018/8/16.
//  Copyright © 2018年 yhwx. All rights reserved.
//

#import "homeView.h"
#import "Masonry.h"
//#import "HomeCollectionView.h"
#import "homeCollectionViewCell.h"

static CGFloat const kmg = 10;
static CGFloat const khomeCollectionViewHeaderH = 100;
static NSString* const khomeCellId = @"homeCellId";
static NSString* const khomeHeaderId = @"homeHeader";
static NSString* const khomeFooterId = @"footHeader";

@interface homeView ()<UICollectionViewDataSource>

@property(nonatomic, strong) UIScrollView *swiper;
@property(nonatomic, strong) UIScrollView *scrollView;
@property(nonatomic, strong) UICollectionView *collectionView;
@property(nonatomic, strong) UIView *listItemBox;

@end

@implementation homeView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)init
{
    self = [super init];
    if (self) {
//        self.backgroundColor = UIColorBlue;
        [self setupViews];
    }
    return self;
}

- (void)setupViews {
    
    if (self.scrollView) {
        return;
    };
    self.scrollView = ({
        UIScrollView *scrollView = [UIScrollView new];
        self.scrollView = scrollView;
        scrollView.showsVerticalScrollIndicator = YES;
        scrollView.userInteractionEnabled = YES;
        scrollView.bounces = YES;
        scrollView.scrollEnabled = YES;
        scrollView.contentSize = CGSizeMake(kscreen_width, 600);
        [self addSubview:scrollView];
        [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
        
        scrollView;
    });
    
    //----轮播----
    UIImageView *imageView = [[UIImageView alloc] initWithImage:UIImageMake(@"banner1")];
    [self.scrollView addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.scrollView.mas_top);
        make.width.mas_equalTo(kscreen_width);
        make.height.mas_equalTo(kscreen_width*4/9);
    }];
    
    //----租赁流程----
    UIView *flowContainerView = [UIView new];
    flowContainerView.backgroundColor = UIColorWhite;
    [self.scrollView addSubview:flowContainerView];
    [flowContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(imageView.mas_bottom);
        make.width.mas_equalTo(@(kscreen_width));
        make.height.mas_equalTo(@(110));
    }];
    //竖线
    UIView *view = [UIView new];
    [flowContainerView addSubview:view];
    view.backgroundColor = [UIColor colorWithRed:51.0031/255.0 green:51.0031/255.0 blue:51.0031/255.0 alpha:1];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(2, 16));
        make.top.mas_equalTo(flowContainerView).offset(15);
        make.left.mas_equalTo(flowContainerView).offset(15);
    }];
    //租赁流程文本
    UILabel *label = [[UILabel alloc] init];
    [flowContainerView addSubview:label];
    label.text = @"租赁流程";
    label.font = [UIFont systemFontOfSize:17];
    label.textColor = [UIColor colorWithRed:51.0026/255.0 green:51.0026/255.0 blue:51.0026/255.0 alpha:1];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@(17));
        make.left.equalTo(view).offset(10);
        make.top.mas_equalTo(view);
    }];
    //流程
    UIImageView *setpImageView = [[UIImageView alloc]initWithImage:UIImageMake(@"step")];
    [flowContainerView addSubview:setpImageView];
    [setpImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(view.mas_bottom).mas_offset(10);
        make.size.mas_equalTo(CGSizeMake(kscreen_width - 36, (kscreen_width - 30)*(0.16)));
        make.left.mas_equalTo(18);
    }];
    
    //----专区----
    UIView *partContainerView = [UIView new];
    [self.scrollView addSubview: partContainerView];
    partContainerView.backgroundColor = UIColorWhite;
    [partContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self);
        make.height.equalTo(@(90));
        make.top.equalTo(flowContainerView.mas_bottom).offset(15);
        make.left.equalTo(self);
    }];
    //tel专区
    UIImageView *telView = [[UIImageView alloc]initWithImage:UIImageMake(@"tel")];;
    [partContainerView addSubview:telView];
    [telView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake((kscreen_width-60)/3, 60));
        make.top.left.equalTo(partContainerView).offset(15);
    }];
    UILabel *telTxt = [[UILabel alloc] init];
    [telView addSubview: telTxt];
    telTxt.text = @"手机专区";
    telTxt.textAlignment = NSTextAlignmentCenter;
    telTxt.font = [UIFont systemFontOfSize:15];
    telTxt.textColor = UIColorWhite;
    [telTxt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(100, 15));
        make.center.equalTo(telView);
    }];
    //ipad专区
    UIImageView *ipadView = [[UIImageView alloc]initWithImage:UIImageMake(@"ipad")];;
    [partContainerView addSubview:ipadView];
    [ipadView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake((kscreen_width-60)/3, 60));
        make.top.equalTo(partContainerView).offset(15);
        make.left.equalTo(telView.mas_right).offset(15);
    }];
    UILabel *ipadTxt = [[UILabel alloc] init];
    [ipadView addSubview: ipadTxt];
    ipadTxt.text = @"ipad专区";
    ipadTxt.textAlignment = NSTextAlignmentCenter;
    ipadTxt.font = [UIFont systemFontOfSize:15];
    ipadTxt.textColor = UIColorWhite;
    [ipadTxt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(100, 15));
        make.center.equalTo(ipadView);
    }];
    //computer专区
    UIImageView *computerView = [[UIImageView alloc]initWithImage:UIImageMake(@"computer")];;
    [partContainerView addSubview:computerView];
    [computerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake((kscreen_width-60)/3, 60));
        make.top.equalTo(partContainerView).offset(15);
        make.left.equalTo(ipadView.mas_right).offset(15);
    }];
    UILabel *computerTxt = [[UILabel alloc] init];
    [computerView addSubview: computerTxt];
    computerTxt.text = @"笔记本专区";
    computerTxt.textAlignment = NSTextAlignmentCenter;
    computerTxt.font = [UIFont systemFontOfSize:15];
    computerTxt.textColor = UIColorWhite;
    [computerTxt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(100, 15));
        make.center.equalTo(computerView);
    }];

////    ----热门推荐----
//    UIView *hotBox = [UIView new];
//    [self.scrollView addSubview:hotBox];
//    [hotBox mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(partContainerView.mas_bottom).offset(15);
//        make.size.mas_equalTo(CGSizeMake(kscreen_width, 1800));
//    }];
//
//    //    竖线
//    UIView *line = [UIView new];
//    [self.collectionView addSubview:line];
//    line.backgroundColor = [UIColor colorWithRed:51.0031/255.0 green:51.0031/255.0 blue:51.0031/255.0 alpha:1];
//    [line mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.size.mas_equalTo(CGSizeMake(2, 16));
//        make.top.mas_equalTo(partContainerView.mas_bottom).offset(15);
//        make.left.mas_equalTo(partContainerView).offset(15);
//    }];
//    //    租赁流程文本
//    UILabel *hotTxt = [[UILabel alloc] init];
//    [self.collectionView addSubview:hotTxt];
//    hotTxt.text = @"热门推荐";
//    hotTxt.font = [UIFont systemFontOfSize:17];
//    hotTxt.textColor = [UIColor colorWithRed:51.0026/255.0 green:51.0026/255.0 blue:51.0026/255.0 alpha:1];
//    [hotTxt mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.height.mas_equalTo(@(17));
//        make.left.equalTo(line).offset(10);
//        make.top.mas_equalTo(line);
//    }];
//

}

@end
