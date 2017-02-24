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

- (void)requestLogin:(NSDictionary *)paras ;

@end
