//
//  UIView+frame.h
//  XZPQ
//
//  Created by Howeel on 2018/8/21.
//  Copyright © 2018年 yhwx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (frame)

@property(nonatomic, assign) CGFloat x;
@property(nonatomic, assign) CGFloat y;

@property(nonatomic, assign) CGFloat centerX;
@property(nonatomic, assign) CGFloat centerY;

@property(nonatomic, assign) CGFloat width;
@property(nonatomic, assign) CGFloat height;

@property(nonatomic, assign) CGSize size;

@property(nonatomic, assign) CGFloat top;
@property(nonatomic, assign) CGFloat bottom;
@property(nonatomic, assign) CGFloat left;
@property(nonatomic, assign) CGFloat right;

@end
