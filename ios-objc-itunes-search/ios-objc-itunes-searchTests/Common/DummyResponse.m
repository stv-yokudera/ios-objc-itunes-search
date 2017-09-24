//
//  DummyResponse.m
//  ios-objc-itunes-searchTests
//
//  Created by OkuderaYuki on 2017/09/25.
//  Copyright © 2017年 YukiOkudera. All rights reserved.
//

#import "DummyResponse.h"

@implementation DummyResponse

+ (NSDictionary *)searchApiJSONDictionary {
    NSBundle *testBundle = [NSBundle bundleForClass:self];
    NSString *jsonPath = [testBundle pathForResource:@"search" ofType:@"json"];
    NSFileHandle *fileHandle = [NSFileHandle fileHandleForReadingAtPath:jsonPath];
    NSData *jsonData = [fileHandle readDataToEndOfFile];
    
    return [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:nil];
}
@end
