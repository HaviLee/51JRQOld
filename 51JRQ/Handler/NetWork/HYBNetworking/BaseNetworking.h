//
//  BaseNetworking.h
//  51JRQ
//
//  Created by HaviLee on 2017/2/24.
//  Copyright © 2017年 HaviLee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseNetworking : NSObject

/**
 单例

 @return 返回网络单例
 */
+ (id)sharedAPIManager;

/**
 客户端登录操作

 @param params get 方法参数
 @param success 成功返回
 @param fail 错误返回
 */
- (void)loginWith:(NSDictionary *)params
             success:(HYBResponseSuccess)success
                fail:(HYBResponseFail)fail;

/**
 个人用户注册

 @param params 传入参数
 @param success 成功返回
 @param fail 错误返回
 */
- (void)registerWith:(NSDictionary *)params
             success:(HYBResponseSuccess)success
                fail:(HYBResponseFail)fail;

/**
 获取数据字典

 @param params 传入参数
 @param success 成功
 @param fail 失败
 */
- (void)queryKeyWith:(NSDictionary *)params
             success:(HYBResponseSuccess)success
                fail:(HYBResponseFail)fail;

/**
 获取验证码-找回密码

 @param params 参数
 @param success 成功
 @param fail 失败
 */
- (void)findOldPassWith:(NSDictionary *)params
             success:(HYBResponseSuccess)success
                fail:(HYBResponseFail)fail;

@end
