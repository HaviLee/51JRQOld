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
- (void)getLoginWith:(NSDictionary *)params
             success:(HYBResponseSuccess)success
                fail:(HYBResponseFail)fail;

@end
