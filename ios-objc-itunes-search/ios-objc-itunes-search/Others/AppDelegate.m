//
//  AppDelegate.m
//  ios-objc-itunes-search
//
//  Created by OkuderaYuki on 2017/09/24.
//  Copyright © 2017年 YukiOkudera. All rights reserved.
//

#import "AppDelegate.h"
#import "TrackIconImageDao.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // TrackIconImageテーブルが存在しなければ作成する
    [TrackIconImageDao createTrackIconImageTable];
    
    return YES;
}

@end
