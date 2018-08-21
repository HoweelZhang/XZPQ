//
//  CollectionViewController.m
//  XZPQ
//
//  Created by Howeel on 2018/8/20.
//  Copyright © 2018年 yhwx. All rights reserved.
//

#import "CollectionViewController.h"
#import "CollectionViewCell.h"

static NSString * const identifier = @"cxCellID";
static CGFloat kMagin = 10.f;
static NSString * const headIdentifier = @"cxHeadID";
static NSString * const footIdentifier = @"cxFootID";
@interface CollectionViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView * collectionView;

@end

@implementation CollectionViewController

#pragma mark - life
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupViews];
    
}
- (void)setupViews {
//    if (!self.collectionView) {
        //自动网格布局
        UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc]init];
        
        CGFloat itemWidth = (self.view.frame.size.width - 3 * kMagin) / 2;
        
        //设置单元格大小
        flowLayout.itemSize = CGSizeMake(itemWidth, itemWidth / 0.618);
        //最小行间距(默认为10)
        flowLayout.minimumLineSpacing = 10;
        //最小item间距（默认为10）
        flowLayout.minimumInteritemSpacing = 10;
        //设置senction的内边距
        flowLayout.sectionInset = UIEdgeInsetsMake(kMagin, kMagin, kMagin, kMagin);
        //设置UICollectionView的滑动方向
        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        //sectionHeader的大小,如果是竖向滚动，只需设置Y值。如果是横向，只需设置X值。
        flowLayout.headerReferenceSize = CGSizeMake(self.view.frame.size.width,100);
        flowLayout.footerReferenceSize = CGSizeMake(self.view.frame.size.width,100);
        //网格布局
        _collectionView = [[UICollectionView alloc]initWithFrame:self.view.frame collectionViewLayout:flowLayout];

        //注册cell
        [_collectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:identifier];
        //注册header
        [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headIdentifier];
        //注册footer
        [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:footIdentifier];
        //设置数据源代理
        _collectionView.dataSource = self;
        
        [self.view addSubview:self.collectionView];
//    }
}

#pragma mark - deleDate
//有多少的分组
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 5;
    
}
//每个分组里有多少个item
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 6;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    //根据identifier从缓冲池里去出cell
    CollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
//    cell.backgroundColor = [UIColor orangeColor];
    
    return cell;
}
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionReusableView *reusableView = nil;
    //kind有两种 一种时header 一种事footer
    if (kind == UICollectionElementKindSectionHeader) {
        
        UICollectionReusableView * header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headIdentifier forIndexPath:indexPath];
        
        header.backgroundColor = [UIColor yellowColor];
        
        reusableView = header;
        
    }else if(kind == UICollectionElementKindSectionFooter){
        
        UICollectionReusableView *footer = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:footIdentifier forIndexPath:indexPath];
        
        footer.backgroundColor = [UIColor blueColor];
        
        reusableView = footer;
    }
    return reusableView;
    
}

@end
