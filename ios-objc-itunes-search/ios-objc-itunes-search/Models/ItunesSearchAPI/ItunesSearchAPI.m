//
//  ItunesSearchAPI.m
//  ios-objc-itunes-search
//
//  Created by OkuderaYuki on 2017/09/24.
//  Copyright © 2017年 YukiOkudera. All rights reserved.
//

#import "APIClient.h"
#import "ItunesSearchAPI.h"
#import "ItunesSearchParamsBuilder.h"
#import "NetworkConnection.h"

@interface ItunesSearchAPI () <APIClientProtocol>
+ (NSString *)baseUrlString;
+ (NSString *)hostName;
@end

@implementation ItunesSearchAPI

- (void)loadWithTerm:(NSString *)term {
    
    if (![NetworkConnection isReachableWithHostName:[ItunesSearchAPI hostName]]) {
        [self.loadable offline];
        return;
    }
    
    NSDictionary *parameters = [ItunesSearchParamsBuilder createWithTerm:term];
    
    __weak typeof(self) wself = self;
    [APIClient getRequest:[ItunesSearchAPI baseUrlString]
               parameters:parameters
                  success:^(id result) {
                      Dlog(@"%@", result)
                      ItunesSearchResponse *response = [[ItunesSearchResponse alloc] initWithResponseObject:result];
                      
                      if (response.results.count == 0) {
                          [wself.loadable emptyData];
                          return;
                      }
                      [wself.loadable loaded:response];
                  }
                  failure:^(NSError *error) {
                      Dlog(@"%@", error)
                      [wself.loadable error];
                  }];
    
}

#pragma mark - APIClientProtocol

+ (NSString *)baseUrlString {
    return @"https://itunes.apple.com/search";
}

+ (NSString *)hostName {
    return @"itunes.apple.com";
}
@end
