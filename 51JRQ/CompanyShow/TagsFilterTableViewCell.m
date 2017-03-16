//
//  TagsFilterTableViewCell.m
//  51JRQ
//
//  Created by HaviLee on 2017/3/16.
//  Copyright © 2017年 HaviLee. All rights reserved.
//

#import "TagsFilterTableViewCell.h"

@implementation TagsFilterTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    _tagListView.alignment = TTGTagCollectionAlignmentFillByExpandingWidth;
    _selectTitle.text = @"不限";
    _tagListView.selectionLimit = 1;
    TTGTextTagConfig *config = [[TTGTextTagConfig alloc]init];
    config.tagBackgroundColor = [UIColor lightGrayColor];
    config.tagSelectedBackgroundColor = [UIColor purpleColor];
    config.tagShadowOffset = CGSizeMake(0, 0);
    _tagListView.defaultConfig = config;
}

- (void)setTags:(NSArray<NSString *> *)tags {
    [_tagListView removeAllTags];
    [_tagListView addTags:tags];

        // Random selected
//    for (NSInteger i = 0; i < 3; i++) {
//        [_tagListView setTagAtIndex:arc4random_uniform((uint32_t)tags.count) selected:YES];
//    }
}



@end
