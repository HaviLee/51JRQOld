//
// CompanyshowView.m
// BaseAppStruct
//
// Created by Havi on 2017/02/23
// Copyright 2017 Havi. All right reserved.
//

#import "CompanyshowView.h"
#import "UIView+MIPipeline.h"
#import "CompanyshowPipeline.h"

@interface CompanyshowView ()

@property (nonatomic, strong) CompanyshowPipeline *pipeline;

@end

@implementation CompanyshowView

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
