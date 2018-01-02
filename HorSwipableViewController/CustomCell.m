//
//  HomeCell.m
//  RepublicShare
//
//  Created by 王攀登 on 2017/8/24.
//  Copyright © 2017年 王攀登. All rights reserved.
//

#import "CustomCell.h"

#import <Masonry.h>

@interface CustomTitleCollectionCell ()

@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation CustomTitleCollectionCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.titleLabel      = [UILabel new];
        self.titleLabel.font = [UIFont systemFontOfSize:18];
        self.titleLabel.text = @"女神";
        self.titleLabel.textColor     = [UIColor whiteColor];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:self.titleLabel];
        
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.offset(0);
        }];
    }
    return self;
}

- (void)congitItemTitile:(NSString *)title {
    self.titleLabel.text = title;
}

- (void)setIsSelected:(BOOL)isSelected {
    _isSelected = isSelected;
    if (isSelected) {
        [UIView animateWithDuration:0.2 animations:^{
            self.titleLabel.font = [UIFont boldSystemFontOfSize:20];
            //  self.titleLabel.transform = CGAffineTransformMakeScale(1.2, 1.2);
        } completion:^(BOOL finished) {
            
        }];
    }else {
        self.titleLabel.font = [UIFont systemFontOfSize:18];
        self.titleLabel.transform = CGAffineTransformMakeScale(1.0, 1.0);
    }
}

+ (NSString *)reuseIdentifier {
    return NSStringFromClass([self class]);
}
@end

