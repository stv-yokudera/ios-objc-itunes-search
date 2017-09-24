//
//  APIClient.m
//  ios-objc-itunes-search
//
//  Created by OkuderaYuki on 2017/09/24.
//  Copyright © 2017年 YukiOkudera. All rights reserved.
//

#import "APIClient.h"
#import "AFNetworking.h"

@implementation APIClient

+ (void)getRequest:(NSString *)urlString
        parameters:(id)parameters
           success:(APISuccess)success
           failure:(APIFailure)failure {
    
    Dlog()
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:urlString
      parameters:parameters
        progress:nil
         success:^(NSURLSessionDataTask *task, id responseObject) {
             success(responseObject);
         }
         failure:^(NSURLSessionDataTask *task, NSError *error) {
             failure(error);
         }];
}
@end
