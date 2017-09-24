//
//  ItunesSearchResponse.m
//  ios-objc-itunes-search
//
//  Created by OkuderaYuki on 2017/09/24.
//  Copyright © 2017年 YukiOkudera. All rights reserved.
//

#import "ItunesSearchResponse.h"

@implementation ItunesSearchResponse

- (instancetype)initWithResponseObject:(id)responseObject {
    [super self];
    if (self) {
        self.resultCount = [responseObject[@"resultCount"] integerValue];
        
        self.results = [@[] mutableCopy];
        for (NSDictionary <NSString *, id> *result in responseObject[@"results"]) {
            Track *newTrack = [Track new];
            newTrack.trackId = [result[@"trackId"] integerValue];
            newTrack.trackName = (NSString *)result[@"trackName"];
            newTrack.artistName = (NSString *)result[@"artistName"];
            newTrack.artworkUrl100 = (NSString *)result[@"artworkUrl100"];
            
            [self.results addObject:newTrack];
        }
    }
    return self;
}
@end
