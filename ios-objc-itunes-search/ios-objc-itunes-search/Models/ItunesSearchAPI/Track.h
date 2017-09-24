//
//  Track.h
//  ios-objc-itunes-search
//
//  Created by OkuderaYuki on 2017/09/24.
//  Copyright © 2017年 YukiOkudera. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Track : NSObject
@property (nonatomic) NSInteger trackId;
@property (nonatomic) NSString *trackName;
@property (nonatomic) NSString *artistName;
@property (nonatomic) NSString *artworkUrl100;
@end
