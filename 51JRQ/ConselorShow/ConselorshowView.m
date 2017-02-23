//
// ConselorshowView.m
// BaseAppStruct
//
// Created by Havi on 2017/02/23
// Copyright 2017 Havi. All right reserved.
//

#import "ConselorshowView.h"
#import "UIView+MIPipeline.h"
#import "ConselorshowPipeline.h"

@interface ConselorshowView ()

@property (nonatomic, strong) ConselorshowPipeline *pipeline;

@end

@implementation ConselorshowView

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
