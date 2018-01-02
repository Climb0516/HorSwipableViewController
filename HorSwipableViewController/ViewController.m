//
//  ViewController.m
//  HorSwipableViewController
//
//  Created by 王攀登 on 2018/1/2.
//  Copyright © 2018年 王攀登. All rights reserved.
//

#import "ViewController.h"

#import "CustomTitleHorSwipViewController.h"
#import "DefaultTitleHorSwipViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    self.tableView.contentInset = UIEdgeInsetsMake(100, 0, 0, 0);
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIndentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier ];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    if (indexPath.row == 0) {
        cell.textLabel.text = @"自定义标签栏";
    }else {
        cell.textLabel.text = @"用框架标签栏";
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0) {
        CustomTitleHorSwipViewController *customVC = [CustomTitleHorSwipViewController new];
        [self presentViewController:customVC animated:YES completion:nil];
    }else {
        DefaultTitleHorSwipViewController *defaultVC = [DefaultTitleHorSwipViewController new];
        [self presentViewController:defaultVC animated:YES completion:nil];
    }
}

@end
