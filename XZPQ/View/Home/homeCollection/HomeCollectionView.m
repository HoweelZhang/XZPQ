//
//  HomeCollectionView.m
//  XZPQ
//
//  Created by Howeel on 2018/8/21.
//  Copyright © 2018年 yhwx. All rights reserved.
//

#import "HomeCollectionView.h"
#import "homeCollectionViewCell.h"

static CGFloat const kmg = 10;
static CGFloat const khomeCollectionViewHeaderH = 100;
static NSString* const khomeCellId = @"homeCellId";
static NSString* const khomeHeaderId = @"homeHeader";
static NSString* const khomeFooterId = @"footHeader";

@interface HomeCollectionView()<UICollectionViewDataSource>

@end

@implementation HomeCollectionView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupViews];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
    }
    return self;
}

- (void)setupViews {
//    if(!self){
        //自动网格布局(UICollectionViewLayout的hooks)
        UICollectionViewFlowLayout *flowLayout = [UICollectionViewFlowLayout new];
        
        CGFloat itemWidth = (self.width - 3 * kmg) / 2;
        
        //设置单元格大小
        flowLayout.itemSize = CGSizeMake(itemWidth, itemWidth / 3);
        
        //最小行间距
        flowLayout.minimumLineSpacing = kmg;
        
        //最小item间距
        flowLayout.minimumInteritemSpacing = kmg;
        
        //设置section的内边距
        flowLayout.sectionInset = UIEdgeInsetsMake(kmg, kmg, kmg, kmg);
        
        //设置UICollectionView的滑动方向(默认DirectionVertical)
        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        
        //sectionHeader的大小，如果是竖向滚动，只需设置Y值，如果是横向，只需要设置X值 （sectionFooter同理）
        flowLayout.headerReferenceSize = CGSizeMake(self.width, khomeCollectionViewHeaderH);
        //flowLayout.footerReferenceSize = CGSizeMake(self.view.frame.size.width,100);
        
        //创建collectionView和设置布局
        UICollectionView *collectionView = [UICollectionView new];
       
        collectionView.collectionViewLayout = flowLayout;
        
        //设置数据源
        collectionView.dataSource = self;
        
        //注册cell
        [collectionView registerClass:[homeCollectionViewCell class] forCellWithReuseIdentifier:khomeCellId];
        
        //注册header
        [collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:khomeHeaderId];
//    }
}

#pragma mark - dataSorceDelegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 1;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    // 从缓存队列中获取cell
    homeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:khomeCellId forIndexPath:indexPath];
    
    return cell;
}


- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    UICollectionReusableView *reusableView = nil;
    //kind有两种 一种时header 一种事footer
    if (kind == UICollectionElementKindSectionHeader) {
        
        UICollectionReusableView * header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:khomeHeaderId forIndexPath:indexPath];
        
        header.backgroundColor = [UIColor yellowColor];
        
        reusableView = header;
        
    }else if(kind == UICollectionElementKindSectionFooter){
        
        UICollectionReusableView *footer = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:khomeFooterId forIndexPath:indexPath];
        
        footer.backgroundColor = [UIColor blueColor];
        
        reusableView = footer;
    }
    return reusableView;
}




@end
