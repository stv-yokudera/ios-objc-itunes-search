//
//  APIClient.h
//  ios-objc-itunes-search
//
//  Created by OkuderaYuki on 2017/09/24.
//  Copyright © 2017年 YukiOkudera. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^APISuccess)(id responseObject);
typedef void (^APIFailure)(NSError *error);

@protocol APIClientProtocol
+ (NSString *)baseUrlString;
+ (NSString *)hostName;
@end

@interface APIClient : NSObject

/**
 GETリクエスト
 @param urlString リクエストURL
 @param parameters リクエストパラメータ
 @param success 成功時のハンドラー (void (^)(id responseObject))
 @param failure 失敗時のハンドラー (void (^)(NSError *error))
 */
+ (void)getRequest:(NSString *)urlString
        parameters:(id)parameters
           success:(APISuccess)success
           failure:(APIFailure)failure;
@end
