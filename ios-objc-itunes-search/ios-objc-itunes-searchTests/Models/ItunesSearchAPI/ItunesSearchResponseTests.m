//
//  ItunesSearchResponseTests.m
//  ios-objc-itunes-searchTests
//
//  Created by OkuderaYuki on 2017/09/25.
//  Copyright © 2017年 YukiOkudera. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DummyResponse.h"
#import "ItunesSearchResponse.h"

@interface ItunesSearchResponseTests : XCTestCase

@end

@implementation ItunesSearchResponseTests

- (void)testMapping {
    NSDictionary *dummy = [DummyResponse searchApiJSONDictionary];
    
    ItunesSearchResponse *searchResponse = [[ItunesSearchResponse alloc] initWithResponseObject:dummy];
    
    XCTAssertEqual(searchResponse.resultCount, 1);
    XCTAssertEqual(searchResponse.results.firstObject.trackId, 256412807);
    XCTAssertEqualObjects(searchResponse.results.firstObject.trackName, @"桜");
    XCTAssertEqualObjects(searchResponse.results.firstObject.artistName, @"コブクロ");
    XCTAssertEqualObjects(searchResponse.results.firstObject.artworkUrl100, @"http://is3.mzstatic.com/image/thumb/Music/v4/73/bd/7c/73bd7c40-2e85-d5a9-3549-5a8bbdabfb50/source/100x100bb.jpg");
}
@end
