//
//  DummyResponse.h
//  ios-objc-itunes-searchTests
//
//  Created by OkuderaYuki on 2017/09/25.
//  Copyright © 2017年 YukiOkudera. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DummyResponse : NSObject

/**
 検索APIのダミーレスポンス

 @return ダミーレスポンス
 */
+ (NSDictionary *)searchApiJSONDictionary;
@end
