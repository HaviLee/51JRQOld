//
//  NSObject+Common.m
//  BaseAppStruct
//
//  Created by Havi on 16/6/21.
//  Copyright © 2016年 Havi. All rights reserved.
//

#import "NSObject+Common.h"
#import "BaseNetworkAPI.h"

#define kPath_ImageCache @"ImageCache"
#define kPath_ResponseCache @"ResponseCache"
#define kTestKey @"BaseURLIsTest"

@implementation NSObject (Common)

#pragma mark baseUrl 处理url
//处理基本的BaseUrl
+ (NSString *)baseURLStr
{
    NSString *baseURLStr = nil;
    if ([self baseURLStrIsTest]) {
        baseURLStr = kAppTestBaseURL;
    }else{
        baseURLStr = kAppBaseURL;
    }
    return baseURLStr;
}

+ (BOOL)baseURLStrIsTest
{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    return [[userDefault objectForKey:kTestKey] boolValue];
}

+ (void)changeBaseURLStrToTest:(BOOL)isTest
{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    [userDefault setObject:@(isTest) forKey:kTestKey];
    [userDefault synchronize];
    //将api中的client改变为测试环境
    [BaseNetworkAPI changeJSONClient];
    //我们可以在切换之后进行其他的操作，比如改变导航栏的颜色
//    [[UINavigationBar appearance] setBackgroundImage: [UIImage imageWithColor:[UIColor colorWithHexString:isTest?@"0x3bbd79": @"0x28303b"]] forBarMetrics:UIBarMetricsDefault];
}



@end
