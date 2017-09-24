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

static NSString *const ItunesSearchAPIUrlString = @"https://itunes.apple.com/search";
static NSString *const ItunesSearchAPIHostName = @"itunes.apple.com";

@implementation ItunesSearchAPI

- (void)loadWithTerm:(NSString *)term {
    
    if (![NetworkConnection isReachableWithHostName:ItunesSearchAPIHostName]) {
        [self.loadable offline];
        return;
    }
    
    NSDictionary *parameters = [ItunesSearchParamsBuilder createWithTerm:term];
    
    __weak typeof(self) wself = self;
    [APIClient getRequest:ItunesSearchAPIUrlString
               parameters:parameters
                  success:[wself itunesSearchAPISuccess]
                  failure:[wself itunesSearchAPIFailure]];
    
}

#pragma mark - private methods

- (APISuccess)itunesSearchAPISuccess {
    
    __weak typeof(self) wself = self;
    return ^(id responseObject) {
        Dlog(@"%@", responseObject)
        ItunesSearchResponse *response = [[ItunesSearchResponse alloc] initWithResponseObject:responseObject];
        
        if (response.results.count == 0) {
            [wself.loadable emptyData];
            return;
        }
        [wself.loadable loaded:response];
    };
}

- (APIFailure)itunesSearchAPIFailure {
    
    __weak typeof(self) wself = self;
    return ^(NSError *error) {
        Dlog(@"%@", error)
        [wself.loadable error];
    };
}
@end
