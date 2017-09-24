//
//  TracksProvider.h
//  ios-objc-itunes-search
//
//  Created by OkuderaYuki on 2017/09/24.
//  Copyright © 2017年 YukiOkudera. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Track.h"

typedef NS_ENUM (NSUInteger, CellType) {
    CellTypeTrack,
    CellTypeEmpty
};

@interface TracksProvider : NSObject <UITableViewDataSource>
@property (nonatomic, readonly)NSArray <Track *> *tracks;

- (void)set:(NSArray <Track *> *)tracks;
- (CellType)cellType;
@end
