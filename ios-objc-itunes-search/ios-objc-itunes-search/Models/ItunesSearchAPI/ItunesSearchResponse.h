//
//  ItunesSearchResponse.h
//  ios-objc-itunes-search
//
//  Created by OkuderaYuki on 2017/09/24.
//  Copyright © 2017年 YukiOkudera. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Track.h"

@interface ItunesSearchResponse : NSObject
@property (nonatomic) NSInteger resultCount;
@property (nonatomic) NSMutableArray <Track *> *results;

- (instancetype)initWithResponseObject:(id)responseObject;
@end
