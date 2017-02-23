//
//  BaseNetworkAPI.h
//  BaseAppStruct
//
//  Created by Havi on 16/6/21.
//  Copyright © 2016年 Havi. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

#define requestBlock void (^)(id data,NSError *error)

/**
 *  定义请求类型
 */

typedef enum {
    Get = 0,
    Post,
    Put,
    Delete
} NetworkMethod;

@interface BaseNetworkAPI : AFHTTPSessionManager

/**
 *  创建一个单例，此单例在后面的网络请求中
 *
 *  @return Network单例
 */

+ (instancetype)sharedJSONClient;

/**
 *  更改网络ip地址或者其他一些Client参数
 *
 *  @return 返回更改后的网络请求Client
 */

+ (instancetype)changeJSONClient;


/**
 *  http client
 *
 *  @param requestPath   http path to requst source
 *  @param requestParams request params
 *  @param requestMethod request type
 *  @param block         completion blcok
 */

- (void)requestJSONDataWithPath:(NSString *)requestPath
                     withParams:(NSDictionary *)requestParams
              withNetWorkMethod:(NetworkMethod)requestMethod
                       andBlock:(void (^)(id data, NSError *error))block;

- (void)uploadImage:(UIImage *)image path:(NSString *)path name:(NSString *)name
       successBlock:(void (^)(id responseObject))success
       failureBlock:(void (^)(NSError *error))failure
      progerssBlock:(void (^)(CGFloat progressValue))progress;

- (void)downloadImageWithPath:(NSString *)path
       successBlock:(void (^)(id responseObject))success
       failureBlock:(void (^)(NSError *error))failure
        progerssBlock:(void (^)(CGFloat progressValue))progress;

@end
