//
//  FilePath.m
//  ios-objc-itunes-search
//
//  Created by OkuderaYuki on 2017/09/24.
//  Copyright © 2017年 YukiOkudera. All rights reserved.
//

#import "FilePath.h"

@implementation FilePath

+ (NSString *)documentsDirectory {
    return NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
}

+ (NSString *)dbPath {
    
    if ([self isTesting]) {
        return [self.documentsDirectory stringByAppendingPathComponent:@"unittest.db"];
    }
    return [self.documentsDirectory stringByAppendingPathComponent:@"product.db"];
}

/**
 XCTest実行中かどうかチェックする

 @return true: XCTest実行中, false: XCTest実行中でない
 */
+ (BOOL) isTesting {
    NSDictionary* environment = NSProcessInfo.processInfo.environment;
    return environment[@"XCTestConfigurationFilePath"] != nil;
}
@end
