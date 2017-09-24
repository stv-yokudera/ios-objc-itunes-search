//
//  TrackIconImage.m
//  ios-objc-itunes-search
//
//  Created by OkuderaYuki on 2017/09/24.
//  Copyright © 2017年 YukiOkudera. All rights reserved.
//

#import "TrackIconImage.h"

@implementation TrackIconImage
- (instancetype)initWithTrackId:(NSInteger)trackId imageData:(NSData *)imageData {
    [super self];
    if (self) {
        self.trackId = trackId;
        self.imageData = imageData;
    }
    return self;
}
@end
