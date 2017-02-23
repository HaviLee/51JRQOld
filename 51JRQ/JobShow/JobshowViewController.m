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

@interface JobshowViewController ()

@property (nonatomic, strong) JobshowPipeline *pipeline;

@end

@implementation JobshowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Add you own code 
}

- (void)setupPipeline:(__kindof MIPipeline *)pipeline {
    self.pipeline = pipeline;
}

@end
