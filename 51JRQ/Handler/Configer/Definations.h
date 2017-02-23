//
//  Definations.h
//  HaviModel
//
//  Created by Havi on 15/12/5.
//  Copyright © 2015年 Havi. All rights reserved.
//

#ifndef Definations_h
#define Definations_h


#endif /* Definations_h */

#define kAppBaseURL @"http://webservice.meddo99.com:9000/"
#define kAppTestBaseURL @"http://webservice.meddo99.com:9001/"
#define kKeyWindow [UIApplication sharedApplication].keyWindow
#define kUserDefaults [NSUserDefaults standardUserDefaults]
#define kAdImageName @"adImageName";

#define kWXPlatform @"wx.com"
#define kSinaPlatform @"sina.com"
#define kTXPlatform @"qq.com"
#define kMeddoPlatform @"meddo99.com"

#define kWXAPPKey @"wx7be2e0c9ebd9e161"
#define kWXAPPSecret @"8fc579120ceceae54cb43dc2a17f1d54"
//
#define kWBAPPKey @"2199355574"
#define kWBRedirectURL @"http://www.meddo.com"

#define kBadgeKey [NSString stringWithFormat:@"badge%@",thirdPartyLoginUserId]


#define StatusbarSize 20
#define kDefaultWordFont      [UIFont systemFontOfSize:17]
#define kDefaultColor [UIColor colorWithRed:0.145f green:0.733f blue:0.957f alpha:1.00f]
#define kLightColor [UIColor whiteColor]

#define kTextColorPicker DKColorWithColors(kDefaultColor, kLightColor)
#define kViewTintColorPicker DKColorWithColors(kDefaultColor, kLightColor)

#if DEBUG
#define DeBugLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#define DeBugLog(tmt, ...)
#endif

//cell 颜色效果
#define kNaviBarBackColor        [UIColor colorWithRed:0.380 green:0.255 blue:0.224 alpha:1.00]
#define kHomeOrderBarColor       [UIColor colorWithRed:0.945 green:0.784 blue:0.478 alpha:1.00]
#define kCarOrderBarColor        [UIColor colorWithRed:0.475 green:0.659 blue:0.565 alpha:1.00]
#define kFocusTextColor          [UIColor colorWithRed:0.890 green:0.502 blue:0.400 alpha:1.00]
#define kBarLightTextColor       [UIColor colorWithRed:0.957 green:0.906 blue:0.729 alpha:1.00]
#define kSepetorColor            [UIColor colorWithRed:0.953 green:0.953 blue:0.953 alpha:1.00]

#define kTextNormalWordFont [UIFont systemFontOfSize:17]
#define kTextTitleWordFont [UIFont systemFontOfSize:17]

#define kButtonViewWidth [UIScreen mainScreen].bounds.size.width - 40
#define kScreen_Bounds [UIScreen mainScreen].bounds
#define kScreen_Height [UIScreen mainScreen].bounds.size.height
#define kScreen_Width [UIScreen mainScreen].bounds.size.width

#define ISIPHON4 [UIScreen mainScreen].bounds.size.height==480 ? YES:NO
#define ISIPHON6 [UIScreen mainScreen].bounds.size.height>568 ? YES:NO

#define RGBA(R/*红*/, G/*绿*/, B/*蓝*/, A/*透明*/) \
[UIColor colorWithRed:R/255.f green:G/255.f blue:B/255.f alpha:A]

