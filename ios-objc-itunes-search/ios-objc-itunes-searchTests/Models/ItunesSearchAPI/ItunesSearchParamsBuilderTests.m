//
//  ItunesSearchParamsBuilderTests.m
//  ios-objc-itunes-searchTests
//
//  Created by OkuderaYuki on 2017/09/24.
//  Copyright © 2017年 YukiOkudera. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ItunesSearchParamsBuilder.h"

@interface ItunesSearchParamsBuilderTests : XCTestCase

@end

@implementation ItunesSearchParamsBuilderTests

- (void)testCreate {
    
    NSString *term = @"コブクロ";
    NSDictionary *parameters = [ItunesSearchParamsBuilder createWithTerm:term];
    
    XCTAssertEqualObjects(parameters[@"term"], @"コブクロ");
    XCTAssertEqualObjects(parameters[@"country"], @"JP");
    XCTAssertEqualObjects(parameters[@"lang"], @"ja_jp");
    XCTAssertEqualObjects(parameters[@"media"], @"music");
}

@end
