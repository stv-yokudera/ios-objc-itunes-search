//
//  NetworkConnection.h
//  ios-objc-itunes-search
//
//  Created by OkuderaYuki on 2017/09/24.
//  Copyright © 2017年 YukiOkudera. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkConnection : NSObject

/**
 通信状況を取得する
 
 @param hostName 接続先のHost名
 @return YES: 通信可能, NO: 通信不可
 */
+ (BOOL)isReachableWithHostName:(NSString *)hostName;
@end
