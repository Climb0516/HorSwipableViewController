//
//  HomeModel.m
//  RepublicShare
//
//  Created by 王攀登 on 2017/8/31.
//  Copyright © 2017年 王攀登. All rights reserved.
//

#import "CustomModel.h"

@implementation CustomTabModel

+ (CGFloat)caluteHomeTabTextWidthWithText:(CustomTabModel *)model {
    return  [self caluteTextViewSizeWithText:model.Name textFont:[UIFont boldSystemFontOfSize:20] textViewWidth:9999 textViewHeight:44.0f lineSpacing:0].width +10;
}

+ (CGSize)caluteTextViewSizeWithText:(NSString *)text textFont:(UIFont *)font textViewWidth:(CGFloat)textViewWidth textViewHeight:(CGFloat)textViewHeight lineSpacing:(CGFloat)lineSpace  {
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    if (lineSpace > 0) {
        paragraphStyle.lineSpacing = lineSpace; //设置行间距
    }
    NSDictionary *attributes = @{NSFontAttributeName : font, NSParagraphStyleAttributeName : paragraphStyle};
    
    CGSize size = [text boundingRectWithSize:CGSizeMake(textViewWidth, textViewHeight)
                                     options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                  attributes:attributes context:nil].size;
    return size;
}

@end


