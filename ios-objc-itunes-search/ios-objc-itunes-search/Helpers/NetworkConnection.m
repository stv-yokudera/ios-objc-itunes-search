//
//  NetworkConnection.m
//  ios-objc-itunes-search
//
//  Created by OkuderaYuki on 2017/09/24.
//  Copyright © 2017年 YukiOkudera. All rights reserved.
//

#import "NetworkConnection.h"
#import "Reachability.h"

@implementation NetworkConnection
+ (BOOL)isReachableWithHostName:(NSString *)hostName {
    Reachability *reachability = [Reachability reachabilityWithHostName:hostName];
    return [reachability isReachable];
}
@end
