//
//  TagFilterTableViewCell.m
//  51JRQ
//
//  Created by HaviLee on 2017/3/16.
//  Copyright © 2017年 HaviLee. All rights reserved.
//

#import "TagFilterTableViewCell.h"

@interface TagFilterTableViewCell ()

@end

@implementation TagFilterTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _tagView = [[TTGTextTagCollectionView alloc]init];
        _tagView.alignment = TTGTagCollectionAlignmentFillByExpandingWidth;
        _label = [[UILabel alloc]init];
        [self.contentView sd_addSubviews:@[_tagView,_label]];
        _label.sd_layout
        .leftSpaceToView(self.contentView,15)
        .topSpaceToView(self.contentView,0)
        .heightIs(30)
        .rightSpaceToView(self.contentView,15);

        _tagView.sd_layout
        .topSpaceToView(_label,0)
        .leftSpaceToView(self.contentView,15)
        .rightSpaceToView(self.contentView,15)
        .bottomSpaceToView(self.contentView,5);
    }
    [self setupAutoHeightWithBottomView:_tagView bottomMargin:5];
    return self;
}

- (void)setTags:(NSArray<NSString *> *)tags {
    [_tagView removeAllTags];
    [_tagView addTags:tags];

        // Random selected
    for (NSInteger i = 0; i < 3; i++) {
        [_tagView setTagAtIndex:arc4random_uniform((uint32_t)tags.count) selected:YES];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
