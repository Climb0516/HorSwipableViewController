//
//  CustomTitleHorSwipViewController.m
//  HorSwipableViewController
//
//  Created by 王攀登 on 2018/1/2.
//  Copyright © 2018年 王攀登. All rights reserved.
//

#import "CustomTitleHorSwipViewController.h"

#import <YYModel.h>

#import "CustomModel.h"
#import "CustomCell.h"
#import "CustomView.h"
#import "CustomViewController.h"
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
#define WEAKSELF typeof(self) __weak weakSelf = self;
@interface CustomTitleHorSwipViewController ()

@property (nonatomic, strong) CustomView *navView;
@property (nonatomic, strong) NSMutableArray *tabArray;
@property (nonatomic, strong) CustomViewController *customVC;
@property (nonatomic, strong) BaseHorSwipableViewController *swipableVC;

@end

@implementation CustomTitleHorSwipViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initData];
    [self setupNavView];
    [self requestData];
}

- (void)initData {
    self.tabArray = [NSMutableArray new];
    
    CustomTabModel *model = [CustomTabModel new];
    model.Name = @"推荐";
    model.ID   = @"0";
    [self.tabArray addObject:model];
}

- (void)setupNavView {
    self.navView = [[CustomView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kNavBarHeight)];
    WEAKSELF
    self.navView.selectHomeNavCollectionItemBlock = ^(NSInteger selectItem) {
        [weakSelf.swipableVC scrollToIndexAndUpdateTitle:selectItem];
    };
    self.navView.selectHomeNavSearchBlock = ^{
        [weakSelf selectHomeNavSearchBtnClick];
    };
    [self.view addSubview:self.navView];
}

- (void)requestData {
//    NSDictionary *urlParam = [UrlParamManager homeTabUrl];
//    [NetManager postUnsignRequestWithUrlParam:urlParam finished:^(id responseObj) {
//        NSArray *array = responseObj[@"Data"];
//        [self dealWithTabArrayWithArray:array];
//    } failed:^(NSString *errorMsg) {
//        RSLog(@"error:%@",errorMsg);
//        [self dealWithTabArrayWithArray:nil];
//    }];
    CustomTabModel *model = [CustomTabModel new];
    model.Name = @"OC";
    model.ID   = @"1";
    [self.tabArray addObject:model];
    CustomTabModel *adModel = [CustomTabModel new];
    adModel.Name = @"Swift";
    adModel.ID   = @"2";
    [self.tabArray addObject:adModel];
    CustomTabModel *addModel = [CustomTabModel new];
    addModel.Name = @"Python";
    addModel.ID   = @"3";
    [self.tabArray addObject:addModel];
    CustomTabModel *adddModel = [CustomTabModel new];
    adddModel.Name = @"C++";
    adddModel.ID   = @"4";
    [self.tabArray addObject:adddModel];
    CustomTabModel *addddModel = [CustomTabModel new];
    addddModel.Name = @"Java";
    addddModel.ID   = @"5";
    [self.tabArray addObject:addddModel];
    
    [self.navView setTitleArray:self.tabArray];
    [self setupContentVCView];
}

//- (void)dealWithTabArrayWithArray:(NSArray *)array {
//    if (array.count > 0) {
//        [array enumerateObjectsUsingBlock:^(NSDictionary *subdic, NSUInteger idx, BOOL * _Nonnull stop) {
//            [self.tabArray addObject:[CustomTabModel yy_modelWithDictionary:subdic]];
//        }];
//        [array writeToFile:[self saveTabArrayFilePath] atomically:YES];
//    }else {
//        if (self.tabArray.count == 1) {
//            NSArray * models = [NSArray arrayWithContentsOfFile:[self saveTabArrayFilePath]];
//            [models enumerateObjectsUsingBlock:^(NSDictionary *subdic, NSUInteger idx, BOOL * _Nonnull stop) {
//                [self.tabArray addObject:[CustomTabModel yy_modelWithDictionary:subdic]];
//            }];
//        }
//    }
//
//}

- (void)setupContentVCView {
    NSMutableArray *vcArray = [NSMutableArray new];
    WEAKSELF
    [self.tabArray enumerateObjectsUsingBlock:^(CustomTabModel *model, NSUInteger idx, BOOL * _Nonnull stop) {
        weakSelf.customVC = [[CustomViewController alloc] initWithTabId:model.ID tabName:model.Name];
        [vcArray addObject:weakSelf.customVC];
    }];
    
    self.swipableVC = [[BaseHorSwipableViewController alloc] initWithViewControllers:vcArray];
    self.swipableVC.view.frame = CGRectMake(0, kNavBarHeight, kScreenWidth, kScreenHeight-kNavBarHeight-kTabBarHeight);
    self.swipableVC.scrollToVCFromIndexItemBlock  = ^(NSUInteger index){
        weakSelf.navView.selectedSegmentIndex = index;
    };
    [self addChildViewController:self.swipableVC];
    [self.view addSubview:_swipableVC.view];
}

#pragma mark ============= Action ==============

//- (NSString *)saveTabArrayFilePath {
//    NSString * docDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask,YES) lastObject];
//    NSString*newFielPath = [docDir stringByAppendingPathComponent:@"models"];
//    if (![[NSFileManager defaultManager] fileExistsAtPath:newFielPath]) {
//        [[NSFileManager defaultManager] createFileAtPath:newFielPath contents:nil attributes:nil];
//    }
//    return newFielPath;
//}

- (void)selectHomeNavSearchBtnClick {
    NSLog(@"search!!!");
}


@end
