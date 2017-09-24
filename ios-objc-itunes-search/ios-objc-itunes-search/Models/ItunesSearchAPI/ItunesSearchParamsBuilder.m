//
//  ItunesSearchParamsBuilder.m
//  ios-objc-itunes-search
//
//  Created by OkuderaYuki on 2017/09/24.
//  Copyright © 2017年 YukiOkudera. All rights reserved.
//

#import "ItunesSearchParamsBuilder.h"

@implementation ItunesSearchParamsBuilder

+ (NSDictionary <NSString *, id> *)createWithTerm:(NSString *)term {
    NSDictionary <NSString *, id> *params = @{
                                              @"term" : term,
                                              @"country" : @"JP",
                                              @"lang" : @"ja_jp",
                                              @"media" : @"music",
                                              };
    return params;
    
}
@end
