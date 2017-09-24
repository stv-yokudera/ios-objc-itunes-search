//
//  TrackIconImageDao.h
//  ios-objc-itunes-search
//
//  Created by OkuderaYuki on 2017/09/24.
//  Copyright © 2017年 YukiOkudera. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TrackIconImage.h"

@interface TrackIconImageDao : NSObject
+ (void)insert:(TrackIconImage *)newObject;
+ (UIImage *)selectByTrackId:(NSInteger)trackId;
@end
