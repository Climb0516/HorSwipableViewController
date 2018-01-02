//
//  CustomViewController.m
//  HorSwipableViewController
//
//  Created by 王攀登 on 2018/1/2.
//  Copyright © 2018年 王攀登. All rights reserved.
//

#import "CustomViewController.h"

#import <Masonry.h>

@interface CustomViewController ()

@property (nonatomic, copy) NSString *titleString;

@end

@implementation CustomViewController

- (instancetype)initWithTabId:(NSString *)tabId tabName:(NSString *)tabName {
    self = [super init];
    if (self ) {
        self.titleString = tabName;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor redColor];
    UIButton *titleButton = [UIButton new];
    [titleButton setTitle:self.titleString forState:UIControlStateNormal];
    [titleButton setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:titleButton];
    [titleButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.offset(100);
        make.size.mas_equalTo(CGSizeMake(100, 20));
    }];
    
    UIButton *dismissButton = [UIButton new];
    [dismissButton setTitle:@"Back" forState:UIControlStateNormal];
    [dismissButton setBackgroundColor:[UIColor grayColor]];
    [dismissButton addTarget:self action:@selector(dismissBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:dismissButton];
    [dismissButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(titleButton.mas_bottom).offset(50);
        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];
    
}

- (void)dismissBtnClick {
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
