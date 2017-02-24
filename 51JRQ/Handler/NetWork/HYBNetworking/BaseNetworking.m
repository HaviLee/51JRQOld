//
//  BaseNetworking.m
//  51JRQ
//
//  Created by HaviLee on 2017/2/24.
//  Copyright © 2017年 HaviLee. All rights reserved.
//

#import "BaseNetworking.h"
#import "HYBNetworking.h"

static BaseNetworking *baseApi = nil;

@implementation BaseNetworking


+ (id)sharedAPIManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        baseApi = [[BaseNetworking alloc]init];
    });
    return baseApi;
}

- (NSDictionary *)getRequestHeader
{
    return @{
             @"transcode": @"D0001",
             @"type": @"i"
             };
}

- (void)getLoginWith:(NSDictionary *)params success:(HYBResponseSuccess)success
                fail:(HYBResponseFail)fail;
{
    NSDictionary *dic = @{
                          @"head": [self getRequestHeader],
                          @"data": @{
                              @"username": @"13122785292",
                              @"passwd": @"a645d373a63aea2d305163ec247494f4",
                              @"deviceToken": @"e3cb5d936be6dbd95eb57aae3646774611c5acab45f91a0e2e5d05370bcd11be"
                          }
                          };
    [HYBNetworking postWithUrl:@"api/login" refreshCache:YES params:dic success:success fail:fail];
}

@end
