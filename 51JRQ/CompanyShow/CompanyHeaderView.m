//
//  CompanyHeaderView.m
//  51JRQ
//
//  Created by HaviLee on 2017/3/16.
//  Copyright © 2017年 HaviLee. All rights reserved.
//

#import "CompanyHeaderView.h"
#import "SDCycleScrollView.h"

@interface CompanyHeaderView ()<SDCycleScrollViewDelegate>

@property (nonatomic, strong) UIButton *moreButton;
@property (nonatomic, strong) UIImageView *titleImage;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIView *line;

@end

@implementation CompanyHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initSubView];
    }
    return self;
}

- (void)initSubView
{
    _titleImage = [[UIImageView alloc]init];
    _titleLabel = [[UILabel alloc]init];
    [self addSubview:_titleImage];
    [self addSubview:_titleLabel];
    _titleImage.image = [UIImage imageNamed:@"title_back_image"];
    _titleLabel.text = @"公司";
    _titleLabel.textColor = [UIColor whiteColor];
    _titleLabel.backgroundColor = [UIColor clearColor];
    _titleLabel.font = [UIFont systemFontOfSize:kRealSize(24) weight:3];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleImage.sd_layout
    .topSpaceToView(self,0)
    .leftEqualToView(self)
    .heightIs(kRealSize(58))
    .widthIs(kRealSize(120));

    _titleLabel.sd_layout
    .topSpaceToView(self,0)
    .leftEqualToView(self)
    .heightIs(kRealSize(50))
    .widthIs(kRealSize(120));

    _moreButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_moreButton setImage:[UIImage imageNamed:@"cell_arrow_down"] forState:UIControlStateNormal];
    _moreButton.transform=CGAffineTransformMakeRotation(-M_PI/2);

    [self addSubview:_moreButton];
    _moreButton.sd_layout
    .rightSpaceToView(self,0)
    .topEqualToView(self)
    .heightIs(kRealSize(50))
    .widthIs(40);

    _line = [[UIView alloc]init];
    _line.backgroundColor = kNaviBarBackColor;
    [self addSubview:_line];
    _line.sd_layout
    .topSpaceToView(self,kRealSize(50)-1)
    .leftEqualToView(self)
    .rightEqualToView(self)
    .heightIs(1);
//

    NSArray *imagesURLStrings = @[
                                  @"http://scimg.jb51.net/allimg/150629/14-1506291A242927.jpg",
                                  @"http://pic32.photophoto.cn/20140711/0011024086081224_b.jpg",
                                  @"http://pic.58pic.com/58pic/13/87/72/73t58PICjpT_1024.jpg"
                                  ];

        // 情景三：图片配文字
    NSArray *titles = @[@"兴业银行股份有限公司上海分公司",
                        @"兴业银行股份有限公司上海分公司",
                        @"兴业银行股份有限公司上海分公司",
                        @"兴业银行股份有限公司上海分公司"
                        ];
    SDCycleScrollView *cycleScrollView2 = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, kRealSize(50), kScreenSize.width, kRealSize(320)) delegate:self placeholderImage:[UIImage imageNamed:@"placeholder"]];

    cycleScrollView2.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    cycleScrollView2.pageControlStyle = SDCycleScrollViewPageContolStyleAnimated;
    cycleScrollView2.titlesGroup = titles;
    cycleScrollView2.titleLabelBackgroundColor = [UIColor clearColor];
    cycleScrollView2.titleLabelTextAlignment = NSTextAlignmentCenter;
    cycleScrollView2.titleLabelTextFont = [UIFont systemFontOfSize:kRealSize(30) weight:5];
    cycleScrollView2.pageDotImage = [UIImage imageNamed:@"normal_dot"];
    cycleScrollView2.currentPageDotImage = [UIImage imageNamed:@"current_dot"]; // 自定义分页控件小圆标颜色
    [self addSubview:cycleScrollView2];
    [self insertSubview:cycleScrollView2 belowSubview:_titleImage];

        //         --- 模拟加载延迟
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        cycleScrollView2.imageURLStringsGroup = imagesURLStrings;
    });
}

#pragma mark - SDCycleScrollViewDelegate

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"---点击了第%ld张图片", (long)index);
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
