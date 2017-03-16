//
//  TagFilterTableViewCell.h
//  51JRQ
//
//  Created by HaviLee on 2017/3/16.
//  Copyright © 2017年 HaviLee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TTGTextTagCollectionView.h"

@interface TagFilterTableViewCell : UITableViewCell
@property (strong, nonatomic)  TTGTextTagCollectionView *tagView;
@property (strong, nonatomic)  UILabel *label;
- (void)setTags:(NSArray<NSString *> *)tags;
@end
