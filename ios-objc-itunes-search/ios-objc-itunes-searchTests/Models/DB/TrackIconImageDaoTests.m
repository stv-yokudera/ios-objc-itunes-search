//
//  TrackIconImageDaoTests.m
//  ios-objc-itunes-searchTests
//
//  Created by OkuderaYuki on 2017/09/25.
//  Copyright © 2017年 YukiOkudera. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TrackIconImageDao.h"

@interface TrackIconImageDaoTests : XCTestCase

@end

@implementation TrackIconImageDaoTests

- (void)testInsertAndSelect {
    [TrackIconImageDao insert:[self dummyModel]];
    
    UIImage *savedImage = [TrackIconImageDao selectByTrackId:256412807];
    XCTAssertNotNil(savedImage);
    XCTAssertEqual(savedImage.size.height, 100);
    XCTAssertEqual(savedImage.size.width, 100);
}

#pragma mark - Private Methods

- (TrackIconImage *)dummyModel {
    NSBundle *testBundle = [NSBundle bundleForClass:[self class]];
    UIImage *dummyImage = [UIImage imageNamed:@"dummy.png" inBundle:testBundle compatibleWithTraitCollection:nil];
    NSData *dummyImageData = UIImagePNGRepresentation(dummyImage);
    
    return [[TrackIconImage alloc] initWithTrackId:256412807 imageData:dummyImageData];
}

@end
