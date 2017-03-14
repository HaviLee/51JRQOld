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

@interface JobshowView ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) JobshowPipeline *pipeline;
@property (nonatomic, strong) UITableView *homeTableview;

@end

@implementation JobshowView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.homeTableview];
    }
    return self;
}

#pragma mark setter meathod
- (UITableView *)homeTableview
{
    if (!_homeTableview) {
        _homeTableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, kScreenSize.width, kScreenSize.height-49-64) style:UITableViewStyleGrouped];
        _homeTableview.delegate = self;
        _homeTableview.dataSource = self;

    }
    return _homeTableview;
}

#pragma mark tableView delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
}

- (void)setupPipeline:(__kindof MIPipeline *)pipeline {
    self.pipeline = pipeline;
}

@end
