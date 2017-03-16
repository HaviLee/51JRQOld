//
// CompanyshowViewController.m
// BaseAppStruct
//
// Created by Havi on 2017/02/23
// Copyright 2017 Havi. All right reserved.
//

#import "CompanyshowViewController.h"
#import "CompanyshowPipeline.h"
#import "Minya.h"
#import "TagFilterTableViewCell.h"
#import "LMDropdownView.h"
#import "AppDelegate.h"

@interface CompanyshowViewController ()<UITableViewDelegate,UITableViewDataSource,LMDropdownViewDelegate>

@property (nonatomic, strong) CompanyshowPipeline *pipeline;
@property (nonatomic, strong) UITableView *tagTableView;
@property (strong, nonatomic) LMDropdownView *dropdownView;
//测试
@property (nonatomic, strong) NSArray *allTags;
@property (nonatomic, strong) NSMutableArray *cellInfos;

@end

@implementation CompanyshowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Add you own code
    [self setNaviBarItems];
    _allTags = @[
                 @"AutoLayout", @"dynamically", @"calculates", @"the", @"size", @"and", @"position",
                 @"of", @"all", @"the", @"views", @"in", @"your", @"view", @"hierarchy", @"based",
                 @"on", @"constraints", @"placed", @"on", @"those", @"views"
                 ];
    _cellInfos = [NSMutableArray new];
    for (NSInteger i = 0; i < 50; i++) {
        [_cellInfos addObject:[_allTags subarrayWithRange:NSMakeRange(0, i % (_allTags.count + 1))]];
    }
}

- (void)setNaviBarItems
{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"filter_image"] style:UIBarButtonItemStylePlain target:self action:@selector(showFilterView)];
}

- (void)setupPipeline:(__kindof MIPipeline *)pipeline {
    self.pipeline = pipeline;
}

- (void)showFilterView
{
    [self showDropDownViewFromDirection:LMDropdownViewDirectionTop];
}

- (void)showDropDownViewFromDirection:(LMDropdownViewDirection)direction
{
        // Init dropdown view
    if (!self.dropdownView) {
        self.dropdownView = [LMDropdownView dropdownView];
        self.dropdownView.delegate = self;

            // Customize Dropdown style
        self.dropdownView.closedScale = 0.85;
        self.dropdownView.shouldBlurContainerView = YES;
        self.dropdownView.blurRadius = 1;
        self.dropdownView.blackMaskAlpha = 0.1;
        self.dropdownView.animationDuration = 0.5;
        self.dropdownView.animationBounceHeight = 0;
    }
    self.dropdownView.direction = direction;

        // Show/hide dropdown view
    AppDelegate *appdel = (AppDelegate*)[UIApplication sharedApplication].delegate;
    if ([self.dropdownView isOpen]) {
        [self.dropdownView hide];
    }
    appdel.tabBarControllerConfig.tabBarController.tabBar.hidden = YES;
    self.dropdownView.contentBackgroundColor = [UIColor blueColor];
    [self.dropdownView showInView:self.navigationController.visibleViewController.view withContentView:self.tagTableView atOrigin:CGPointMake(0, 64)];
}

- (UITableView*)tagTableView
{
    if (!_tagTableView) {
        _tagTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, kScreenSize.width, kScreenSize.height-64) style:UITableViewStylePlain];
        _tagTableView.delegate = self;
        _tagTableView.dataSource = self;
        _tagTableView.rowHeight = UITableViewAutomaticDimension;
        _tagTableView.estimatedRowHeight = 80;
        _tagTableView.backgroundColor = [UIColor redColor];
    }
    return _tagTableView;
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _cellInfos.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TagFilterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tagcell"];
    if (!cell) {
        cell = [[TagFilterTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"tagcell"];
    }
    [cell setTags:_cellInfos[(NSUInteger) indexPath.row]];
    cell.label.text = @"城市";

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *arrays = _cellInfos[(NSUInteger) indexPath.row];
    TTGTextTagCollectionView *view = [[TTGTextTagCollectionView alloc]initWithFrame:CGRectMake(0, 0, kScreenSize.width-30, 10)];
    [view addTags:arrays];
//    return 100;
    DeBugLog(@"高度是%f",view.contentSize.height);
    return view.contentSize.height + 30 + 10;
}

#pragma mark LMDDropView

- (void)dropdownViewWillShow:(LMDropdownView *)dropdownView
{
    NSLog(@"Dropdown view will show");
}

- (void)dropdownViewDidShow:(LMDropdownView *)dropdownView
{
    NSLog(@"Dropdown view did show");
}

- (void)dropdownViewWillHide:(LMDropdownView *)dropdownView
{
    NSLog(@"Dropdown view will hide");

}

- (void)dropdownViewDidHide:(LMDropdownView *)dropdownView
{
    NSLog(@"Dropdown view did hide");
    AppDelegate *appdel = (AppDelegate*)[UIApplication sharedApplication].delegate;
    CGRect originFrame = appdel.tabBarControllerConfig.tabBarController.tabBar.frame;
    appdel.tabBarControllerConfig.tabBarController.tabBar.frame = CGRectMake(0, originFrame.origin.y, originFrame.size.width, 0);
    appdel.tabBarControllerConfig.tabBarController.tabBar.hidden = NO;
    [UIView animateWithDuration:3 animations:^{
        appdel.tabBarControllerConfig.tabBarController.tabBar.frame = originFrame;
    }];

}


@end
