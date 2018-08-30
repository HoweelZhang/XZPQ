//
//  demoTableViewCell.m
//  XZPQ
//
//  Created by Howeel on 2018/8/29.
//  Copyright © 2018年 yhwx. All rights reserved.
//

#import "demoTableViewCell.h"
#import "Masonry.h"

static NSString * const kCellIdentifier = @"cell";
const UIEdgeInsets kInsets = {15, 16, 15, 16};
const CGFloat kAvatarSize = 30;
const CGFloat kAvatarMarginRight = 12;
const CGFloat kAvatarMarginBottom = 6;
const CGFloat kContentMarginBotom = 10;

@interface demoTableViewCell()

@property(nonatomic, strong) UIImageView *avatarImageView;
@property(nonatomic, strong) QMUILabel *nameLabel;
@property(nonatomic, strong) QMUILabel *contentLabel;
@property(nonatomic, strong) QMUILabel *timeLabel;

@end

@implementation demoTableViewCell

- (void)didInitializeWithStyle:(UITableViewCellStyle)style {
    [super didInitializeWithStyle:style];
    // init 时做的事情请写在这里
    [self setupViews];

}

- (void)updateCellAppearanceWithIndexPath:(NSIndexPath *)indexPath {
    [super updateCellAppearanceWithIndexPath:indexPath];
    // 每次 cellForRow 时都要做的事情请写在这里
}

- (void)setupViews {
    
    UIImage *avatarImage = [UIImage qmui_imageWithColor:[UIColor qmui_randomColor] size:CGSizeMake(60, 60) cornerRadius:8];
    _avatarImageView = [[UIImageView alloc] initWithImage:avatarImage];
    [self.contentView addSubview:_avatarImageView];
    
    _nameLabel = [[QMUILabel alloc] qmui_initWithFont:UIFontBoldMake(16) textColor:UIColorGray];
    [self.contentView addSubview:_nameLabel];
    
    _contentLabel = [[QMUILabel alloc] qmui_initWithFont:UIFontBoldMake(17) textColor:UIColorGrayLighten];
    [self.contentView addSubview:_contentLabel];
    
    _timeLabel = [[QMUILabel alloc] qmui_initWithFont:UIFontBoldMake(13) textColor:UIColorGrayDarken];
    [self addSubview:_timeLabel];
                      
}

- (void)renderWithNameText:(NSString *)nameText contentText:(NSString *)contentText{
    
    self.nameLabel.text = nameText;
    self.contentLabel.attributedText = [self attributeStringWithString:contentText lineHeight:26];
    self.timeLabel.text = @"昨天 18:24";
    
    self.contentLabel.textAlignment = NSTextAlignmentJustified;
}

- (NSAttributedString *)attributeStringWithString:(NSString *)textString lineHeight:(CGFloat)lineHeight {
    if (textString.qmui_trim.length <= 0) return nil;
    NSAttributedString *attriSting = [[NSAttributedString alloc] initWithString:textString attributes:@{NSParagraphStyleAttributeName:[NSMutableParagraphStyle qmui_paragraphStyleWithLineHeight:lineHeight lineBreakMode:NSLineBreakByTruncatingTail textAlignment:NSTextAlignmentCenter]}];
    return attriSting;
}

//重写
- (CGSize)sizeThatFits:(CGSize)size{
    
    CGSize resultSize = CGSizeMake(size.width, 0);
    CGFloat contentLabelWidth = size.width - UIEdgeInsetsGetHorizontalValue(kInsets);
    
    CGFloat resultHeight = size.height - UIEdgeInsetsGetVerticalValue(kInsets) + CGRectGetHeight(self.avatarImageView.bounds) + kAvatarMarginBottom;
    
    if (self.contentLabel.text.qmui_trim.length > 0) {
        CGSize contantSize = [self.contentLabel sizeThatFits:CGSizeMake(contentLabelWidth, CGFLOAT_MAX)];
        resultHeight += (contantSize.height + kContentMarginBotom);
    }
    
    if (self.timeLabel.text.qmui_trim.length > 0) {
        CGSize timeSize = [self.timeLabel sizeThatFits:CGSizeMake(contentLabelWidth, CGFLOAT_MAX)];
        resultHeight += timeSize.height;
    }
    
    resultSize.height = resultHeight;
    NSLog(@"%@ 的 cell 的 sizeThatFits: 被调用（说明这个 cell 的高度重新计算了一遍）", self.nameLabel.text);
    return resultSize;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat contentLabelWidth = CGRectGetWidth(self.contentView.bounds) - UIEdgeInsetsGetHorizontalValue(kInsets);
    self.avatarImageView.frame = CGRectSetXY(self.avatarImageView.frame, kInsets.left, kInsets.top);
    if (self.nameLabel.text.length > 0) {
        CGFloat nameLabelWidth = contentLabelWidth - CGRectGetWidth(self.avatarImageView.bounds) - kAvatarMarginRight;
        CGSize nameSize = [self.nameLabel sizeThatFits:CGSizeMake(nameLabelWidth, CGFLOAT_MAX)];
        self.nameLabel.frame = CGRectFlatMake(CGRectGetMaxX(self.avatarImageView.frame) + kAvatarMarginRight, CGRectGetMinY(self.avatarImageView.frame) + (CGRectGetHeight(self.avatarImageView.bounds) - nameSize.height) / 2, nameLabelWidth, nameSize.height);
    }
    if (self.contentLabel.text.length > 0) {
        CGSize contentSize = [self.contentLabel sizeThatFits:CGSizeMake(contentLabelWidth, CGFLOAT_MAX)];
        self.contentLabel.frame = CGRectFlatMake(kInsets.left, CGRectGetMaxY(self.avatarImageView.frame) + kAvatarMarginBottom, contentLabelWidth, contentSize.height);
    }
    if (self.timeLabel.text.length > 0) {
        CGSize timeSize = [self.timeLabel sizeThatFits:CGSizeMake(contentLabelWidth, CGFLOAT_MAX)];
        self.timeLabel.frame = CGRectFlatMake(CGRectGetMinX(self.contentLabel.frame), CGRectGetMaxY(self.contentLabel.frame) + kContentMarginBotom, contentLabelWidth, timeSize.height);
    }
}

@end
