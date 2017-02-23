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

@interface JobshowView ()

@property (nonatomic, strong) JobshowPipeline *pipeline;

@end

@implementation JobshowView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {

    }
    return self;
}

- (void)setupPipeline:(__kindof MIPipeline *)pipeline {
    self.pipeline = pipeline;
}

@end
