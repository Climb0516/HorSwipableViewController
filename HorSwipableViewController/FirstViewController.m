//
//  FirstViewController.m
//  HorSwipableViewController
//
//  Created by 王攀登 on 2018/1/2.
//  Copyright © 2018年 王攀登. All rights reserved.
//

#import "FirstViewController.h"

#import <Masonry.h>

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
    
    UIButton *dismissButton = [UIButton new];
    [dismissButton setTitle:@"Back" forState:UIControlStateNormal];
    [dismissButton setBackgroundColor:[UIColor grayColor]];
    [dismissButton addTarget:self action:@selector(dismissBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:dismissButton];
    [dismissButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];
}

- (void)dismissBtnClick {
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
