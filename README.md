# HorSwipableViewController
自定义网易新闻标签栏样式
效果图：
![Alt text](https://github.com/Climb0516/HorSwipableViewController/raw/master/Screenshots/1.png)
![Alt text](https://github.com/Climb0516/HorSwipableViewController/raw/master/Screenshots/2.png)
![Alt text](https://github.com/Climb0516/HorSwipableViewController/raw/master/Screenshots/3.png)

BaseHorSwipableViewController 里封装的HorSwipable基类
/** Horizontal初始化 */
- (instancetype)initWithViewControllers:(NSArray *)controllers; //自定义标题栏
- (instancetype)initWithViewControllers:(NSArray *)controllers andTitles:(NSArray *)titles;//default标题栏


CustomTitleHorSwipViewController 是自定义标题栏试图的类
用法：
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


DefaultTitleHorSwipViewController 使用架构的标题栏视图的类
用法：
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




