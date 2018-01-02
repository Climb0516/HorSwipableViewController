//
//  HomeCell.h
//  RepublicShare
//
//  Created by 王攀登 on 2017/8/24.
//  Copyright © 2017年 王攀登. All rights reserved.
//

#import <UIKit/UIKit.h>


/**
 *  标签栏 titleCollectionCell
 */
@interface CustomTitleCollectionCell : UICollectionViewCell

@property (nonatomic, assign) BOOL isSelected;

- (void)congitItemTitile:(NSString *)title;
+ (NSString *)reuseIdentifier;

@end


