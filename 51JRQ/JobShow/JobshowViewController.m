//
// JobshowViewController.m
// BaseAppStruct
//
// Created by Havi on 2017/02/23
// Copyright 2017 Havi. All right reserved.
//

#import "JobshowViewController.h"
#import "JobshowPipeline.h"
#import "Minya.h"
#import "BaseNetworking.h"

@interface JobshowViewController ()<UISearchBarDelegate>

@property (nonatomic, strong) JobshowPipeline *pipeline;
@property (nonatomic, strong) UISearchBar *searchBar;
@property (nonatomic, strong) UIButton *scanButton;

@end

@implementation JobshowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar addSubview:self.searchBar];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"navi_scan_button"] style:UIBarButtonItemStylePlain target:self action:@selector(scanButtonTap)];
    // Add you own code
//    [[BaseNetworking sharedAPIManager] queryKeyWith:nil success:^(id response) {
//
//    } fail:^(NSError *error) {
//
//    }];

    [[BaseNetworking sharedAPIManager] getJobDetailDataWith:@{
    @"token":@"D57A2ACCC6160A6758670861A81B91F8D47E4D4841928E69883BD33D508BF880E2DD4F5C229BEBEC2F94DC9C1575D34DC9714B5932B0B593E386A78C6BA6466F1FD85AEC4E1BBFD8DD091E7641D4C1C30768AAD76472DD03",
    @"tokenKey":@"1BDB4EE8B661CF1D069B57A77E546A9B299817105FF51D868E371D51E1CC3FE3453CA5AC5489F7807205CEE8F3CDFC2CA53AAF930002A8C0",
        @"corpid":@"1010203",
            @"jobid":@"1120001"} success:^(id response) {

    } fail:^(NSError *error) {

    }];
////
    [[BaseNetworking sharedAPIManager] loginWith:nil success:^(id response) {
        DeBugLog(@"登录信息是%@",response);
    } fail:^(NSError *error) {
        
    }];

//
//    [[BaseNetworking sharedAPIManager] findOldPassWith:nil success:^(id response) {
//
//    } fail:^(NSError *error) {
//
//    }];
}

- (UISearchBar *)searchBar
{
    if (!_searchBar) {
        _searchBar = [[UISearchBar alloc]init];
        _searchBar.placeholder = @"搜索资讯、活动、职位";
        _searchBar.frame = CGRectMake(15, 0, kScreenSize.width-15-59, 44);
        _searchBar.userInteractionEnabled = YES;
        _searchBar.delegate = self;
    }
    return _searchBar;
}

#pragma mark search Bar delegate

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar
{
    return NO;
}
- (void)scanButtonTap
{
    DeBugLog(@"scanbutton tap");
}

- (void)searchButtonTap
{
    DeBugLog(@"search bar done");
}

- (void)setupPipeline:(__kindof MIPipeline *)pipeline {
    self.pipeline = pipeline;
}

@end
