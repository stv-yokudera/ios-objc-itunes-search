//
//  TrackIconImageTests.m
//  ios-objc-itunes-searchTests
//
//  Created by OkuderaYuki on 2017/09/25.
//  Copyright © 2017年 YukiOkudera. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TrackIconImage.h"

@interface TrackIconImageTests : XCTestCase

@end

@implementation TrackIconImageTests

- (void)testInit {
    TrackIconImage *trackIconImage = [[TrackIconImage alloc] initWithTrackId:256412807 imageData:[NSData data]];
    
    XCTAssertEqual(trackIconImage.trackId, 256412807);
    XCTAssertEqualObjects(trackIconImage.imageData, [NSData data]);
}

@end
