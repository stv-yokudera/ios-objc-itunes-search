//
//  SQLiteHelper.h
//  ios-objc-itunes-search
//
//  Created by OkuderaYuki on 2017/09/24.
//  Copyright © 2017年 YukiOkudera. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDB.h"

@interface SQLiteHelper : NSObject
@property (nonatomic, readonly) FMDatabase *db;
- (BOOL)dbOpen;
- (BOOL)dbClose;
@end
