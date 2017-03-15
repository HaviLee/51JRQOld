//
// JobshowView.m
// BaseAppStruct
//
// Created by Havi on 2017/02/23
// Copyright 2017 Havi. All right reserved.
//

#import "JobshowView.h"
#import "UIView+MIPipeline.h"
#import "JobshowPipeline.h"
#import "TitleTableViewCell.h"
#import "NewsTableViewCell.h"
#import "ActivityTableViewCell.h"
#import "PositionTitleTableViewCell.h"
#import "PostionTableViewCell.h"
#import "MJRefresh.h"

@interface JobshowView ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) JobshowPipeline *pipeline;
@property (nonatomic, strong) UITableView *homeTableview;

@end

@implementation JobshowView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.homeTableview];
        self.homeTableview.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];

            // Enter the refresh status immediately
        [self.homeTableview.mj_header beginRefreshing];
    }
    return self;
}

#pragma mark setter meathod
- (UITableView *)homeTableview
{
    if (!_homeTableview) {
        _homeTableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenSize.width, kScreenSize.height) style:UITableViewStyleGrouped];
        _homeTableview.delegate = self;
        _homeTableview.dataSource = self;
        _homeTableview.separatorStyle = UITableViewCellSeparatorStyleSingleLine;

    }
    return _homeTableview;
}

#pragma mark tableView delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 3;
    }else if (section == 1){
        return 3;
    }
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            TitleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"titleCell"];
            if (!cell) {
                cell = [[TitleTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"titleCell"];
            }
            cell.titleString = @"资讯";
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
                [cell setSeparatorInset:UIEdgeInsetsZero];
            }
            if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
                [cell setLayoutMargins:UIEdgeInsetsZero];
            }
            return cell;

        }else{
            NewsTableViewCell *newsCell = [tableView dequeueReusableCellWithIdentifier:@"newsCell"];
            if (!newsCell) {
                newsCell = [[NewsTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"newCell"];
            }
            newsCell.selectionStyle = UITableViewCellSelectionStyleNone;
            if ([newsCell respondsToSelector:@selector(setSeparatorInset:)]) {
                [newsCell setSeparatorInset:UIEdgeInsetsZero];
            }
            if ([newsCell respondsToSelector:@selector(setLayoutMargins:)]) {
                [newsCell setLayoutMargins:UIEdgeInsetsZero];
            }
            return newsCell;

        }

    }else if (indexPath.section == 1){
        if (indexPath.row == 0) {
            TitleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"titleCell"];
            if (!cell) {
                cell = [[TitleTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"titleCell"];
            }
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.titleString = @"活动";
            if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
                [cell setSeparatorInset:UIEdgeInsetsZero];
            }
            if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
                [cell setLayoutMargins:UIEdgeInsetsZero];
            }
            return cell;

        }else if(indexPath.row == 1){
            NewsTableViewCell *newsCell = [tableView dequeueReusableCellWithIdentifier:@"newsCell"];
            if (!newsCell) {
                newsCell = [[NewsTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"newCell"];
            }
            newsCell.selectionStyle = UITableViewCellSelectionStyleNone;
            if ([newsCell respondsToSelector:@selector(setSeparatorInset:)]) {
                [newsCell setSeparatorInset:UIEdgeInsetsZero];
            }
            if ([newsCell respondsToSelector:@selector(setLayoutMargins:)]) {
                [newsCell setLayoutMargins:UIEdgeInsetsZero];
            }
            return newsCell;
            
        }else if(indexPath.row == 2){
            ActivityTableViewCell *newsCell = [tableView dequeueReusableCellWithIdentifier:@"activityCell"];
            if (!newsCell) {
                newsCell = [[ActivityTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"activityCell"];
            }
            newsCell.selectionStyle = UITableViewCellSelectionStyleNone;
            if ([newsCell respondsToSelector:@selector(setSeparatorInset:)]) {
                [newsCell setSeparatorInset:UIEdgeInsetsZero];
            }
            if ([newsCell respondsToSelector:@selector(setLayoutMargins:)]) {
                [newsCell setLayoutMargins:UIEdgeInsetsZero];
            }
            return newsCell;

        }
    }else{
        if (indexPath.row == 0) {
            PositionTitleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"positionCell"];
            if (!cell) {
                cell = [[PositionTitleTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"titleCell"];
            }
            cell.titleString = @"推荐职位";
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
                [cell setSeparatorInset:UIEdgeInsetsZero];
            }
            if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
                [cell setLayoutMargins:UIEdgeInsetsZero];
            }
            return cell;

        }else {
            PostionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"posiCell"];
            if (!cell) {
                cell = [[PostionTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"posiCell"];
            }
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0.001;
    }else{
        return 5;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 3) {
        return 0.001;
    }else{
        return 5;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            return 35;
        }else{
            return 150;
        }
    }else if(indexPath.section == 1){
        if (indexPath.row == 0) {
            return 35;
        }else if(indexPath.row == 1){
            return 150;
        }else if(indexPath.row == 2){
            return 90;
        }
    }else if(indexPath.section == 2){
        if (indexPath.row == 0) {
            return 35;
        }else {
            return 90;
        }
    }
    return 0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)loadNewData
{
//    NSString *path = [[NSBundle mainBundle]pathForResource:@"homeData" ofType:@"plist"];
//    [self.dic addObjectsFromArray:[NSArray arrayWithContentsOfFile:path]];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.homeTableview.mj_header endRefreshing];
//        [self.orderView reloadData];
    });
}


- (void)setupPipeline:(__kindof MIPipeline *)pipeline {
    self.pipeline = pipeline;
}

@end
