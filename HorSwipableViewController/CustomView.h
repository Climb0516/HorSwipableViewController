//
//  HomeView.h
//  RepublicShare
//
//  Created by 王攀登 on 2017/8/28.
//  Copyright © 2017年 王攀登. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomView : UIView

@property (nonatomic,assign) NSInteger selectedSegmentIndex;
@property (nonatomic,strong) NSMutableArray *titleArray;
@property (nonatomic, copy) void (^selectHomeNavCollectionItemBlock) (NSInteger selectItem);
@property (nonatomic, copy) void (^selectHomeNavSearchBlock) (void);

@end

