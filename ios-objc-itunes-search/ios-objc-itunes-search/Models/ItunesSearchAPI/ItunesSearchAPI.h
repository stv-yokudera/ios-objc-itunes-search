//
//  ItunesSearchAPI.h
//  ios-objc-itunes-search
//
//  Created by OkuderaYuki on 2017/09/24.
//  Copyright © 2017年 YukiOkudera. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ItunesSearchResponse.h"

/**
 APIリクエスト結果を通知するプロトコル
 */
@protocol ItunesSearchLoadable <NSObject>
- (void)loaded:(ItunesSearchResponse *)response;
- (void)offline;
- (void)emptyData;
- (void)error;
@end

@interface ItunesSearchAPI : NSObject
@property (weak, nonatomic) id<ItunesSearchLoadable>loadable;
- (void)loadWithTerm:(NSString *)term;
@end
