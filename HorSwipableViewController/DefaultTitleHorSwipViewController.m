//
//  DefaultTitleHorSwipViewController.m
//  HorSwipableViewController
//
//  Created by 王攀登 on 2018/1/2.
//  Copyright © 2018年 王攀登. All rights reserved.
//

#import "DefaultTitleHorSwipViewController.h"

#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "BaseHorSwipableViewController.h"

#define kScreenWidth     ([UIScreen mainScreen].bounds.size.width)//屏幕宽
#define kScreenHeight    ([UIScreen mainScreen].bounds.size.height)//屏幕高
#define kScreenRect       ([UIScreen mainScreen].bounds)
#define kWidthRate  (kScreenWidth / 375.0f)
#define kHeightRate (kScreenHeight / 667.0f)
#define kStatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height //状态栏高度
#define kNavBarHeight (kStatusBarHeight + 44) //导航栏高
#define kTabBarHeight (kStatusBarHeight > 20 ? 83 : 49) //Tabbar高
#define kIphoneXBottomSpace (kStatusBarHeight > 20 ? 35 : 0) //没有tabbar时 底部不显示内容高度
// RGB颜色转换（16进制）
#define kRGB16(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
@interface DefaultTitleHorSwipViewController ()

@property (nonatomic, strong) FirstViewController *firstVC;
@property (nonatomic, strong) SecondViewController *secondVC;
@property (nonatomic, strong) ThirdViewController *thirdVC;
@property (nonatomic, strong) BaseHorSwipableViewController *swipableVC;

@end

@implementation DefaultTitleHorSwipViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    NSMutableArray *vcArray = [NSMutableArray new];
    _firstVC  = [[FirstViewController alloc] init];
    [vcArray addObject:_firstVC];
    _secondVC = [[SecondViewController alloc] init];
    [vcArray addObject:_secondVC];
    _thirdVC  = [[ThirdViewController alloc]init];
    [vcArray addObject:_thirdVC];
    
    _swipableVC = [[BaseHorSwipableViewController alloc] initWithViewControllers:vcArray andTitles:@[@"first",@"second",@"third"]];
    _swipableVC.view.frame             = CGRectMake(0, kStatusBarHeight, kScreenWidth, kScreenHeight-kStatusBarHeight);
    _swipableVC.currentLineLabelHeight = 4.5f;
    _swipableVC.titleHeight            = 58.0f;
    _swipableVC.unSelectedTitleColor   = kRGB16(0xFFD634);
    _swipableVC.selectedTitleColor     = kRGB16(0xFFD634);
    [self addChildViewController:self.swipableVC];
    [self.view addSubview:_swipableVC.view];
}



@end
