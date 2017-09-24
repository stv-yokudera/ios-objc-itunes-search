//
//  NetworkConnection.h
//  ios-objc-itunes-search
//
//  Created by OkuderaYuki on 2017/09/24.
//  Copyright © 2017年 YukiOkudera. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkConnection : NSObject
+ (BOOL)isReachableWithHostName:(NSString *)hostName;
@end
