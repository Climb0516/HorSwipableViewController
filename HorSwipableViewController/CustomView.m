//
//  HomeView.m
//  RepublicShare
//
//  Created by 王攀登 on 2017/8/28.
//  Copyright © 2017年 王攀登. All rights reserved.
//

#import "CustomView.h"

#import <Masonry.h>

#import "CustomCell.h"
#import "CustomModel.h"

#define kScreenWidth     ([UIScreen mainScreen].bounds.size.width)//屏幕宽
#define kStatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height //状态栏高度
@interface CustomView ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, assign) NSInteger        currentItem;

@end

@implementation CustomView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initData];
        [self generalUI];
    }
    return self;
}

- (void)initData {
    self.currentItem = 0;
}

- (void)generalUI {
    self.backgroundColor = [UIColor brownColor];
    UIButton *searchButton = [UIButton new];
    [searchButton setImage:[UIImage imageNamed:@"home_search"] forState:UIControlStateNormal];
    [searchButton addTarget:self action:@selector(searchBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:searchButton];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.backgroundColor = [UIColor clearColor];
    self.collectionView.showsHorizontalScrollIndicator = NO;
    [self addSubview:self.collectionView];
    [self.collectionView registerClass:[CustomTitleCollectionCell class] forCellWithReuseIdentifier:[CustomTitleCollectionCell reuseIdentifier]];
    
    [searchButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.collectionView.mas_centerY);
        make.right.equalTo(self.mas_right).offset(-10);
        make.size.mas_equalTo(CGSizeMake(20.0f, 20.0f));
    }];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(kStatusBarHeight);
        make.left.equalTo(self).offset(0.0f);
        make.right.equalTo(searchButton.mas_left).offset(-10);
        make.height.mas_equalTo(44.0f);
    }];
}

- (void)searchBtnClick {
    if (self.selectHomeNavSearchBlock) {
        self.selectHomeNavSearchBlock();
    }
}

- (void)setTitleArray:(NSMutableArray *)titleArray {
    _titleArray = titleArray;
    [_collectionView reloadData];
}

#pragma mark - collectionView

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.titleArray.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CustomTitleCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[CustomTitleCollectionCell reuseIdentifier] forIndexPath:indexPath];
    cell.isSelected = (self.currentItem == indexPath.item ? YES:NO);
    if (self.titleArray.count > 0) {
        CustomTabModel *model = self.titleArray[indexPath.item];
        [cell congitItemTitile:model.Name];
    }
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CustomTabModel *model = self.titleArray[indexPath.item];
    return CGSizeMake([CustomTabModel caluteHomeTabTextWidthWithText:model], 44.0f);
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 16, 0, 0);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 10;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    [self collectionView:collectionView scrollContenOffSetAtIndexPath:indexPath];
    
    if (self.selectHomeNavCollectionItemBlock) {
        self.selectHomeNavCollectionItemBlock(indexPath.item);
    }
}

-(void)setSelectedSegmentIndex:(NSInteger)selectedSegmentIndex {
    NSIndexPath *indexpath = [NSIndexPath indexPathForItem:selectedSegmentIndex inSection:0];
    [self collectionView:_collectionView scrollContenOffSetAtIndexPath:indexpath];
}

- (void)collectionView:(UICollectionView *)collectionView scrollContenOffSetAtIndexPath:(NSIndexPath *)indexPath {
    CustomTitleCollectionCell *cell = (CustomTitleCollectionCell *)[collectionView cellForItemAtIndexPath:indexPath];
    self.currentItem = indexPath.item;
    [collectionView reloadData];
    // 计算偏移量
    CGFloat offset = cell.center.x - (kScreenWidth-60)*0.5;
    if (offset < 0) {
        offset = 0.f;
    }
    // 获取最大滚动范围
    CGFloat maxOffset = collectionView.contentSize.width - (kScreenWidth-60);
    if (offset >= maxOffset) {
        offset = maxOffset;
    }
    [collectionView setContentOffset:CGPointMake(offset, 0) animated:YES];
}

@end

