//
//  HomeModel.h
//  RepublicShare
//
//  Created by 王攀登 on 2017/8/31.
//  Copyright © 2017年 王攀登. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

@interface CustomTabModel : NSObject

@property (nonatomic, copy) NSString *Name;
@property (nonatomic, copy) NSString *ID;

+ (CGFloat)caluteHomeTabTextWidthWithText:(CustomTabModel *)model;

@end
