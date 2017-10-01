//
//  SQLiteHelper.m
//  ios-objc-itunes-search
//
//  Created by OkuderaYuki on 2017/09/24.
//  Copyright © 2017年 YukiOkudera. All rights reserved.
//

#import "FilePath.h"
#import "SQLiteHelper.h"

@interface SQLiteHelper ()
@property (nonatomic, readwrite) FMDatabase *db;
@end

@implementation SQLiteHelper

- (instancetype)init {
    self = [super init];
    if (self) {
        NSString *dbPath = [FilePath dbPath];
        Dlog(@"dbPath: %@", dbPath);
        self.db = [[FMDatabase alloc] initWithPath:dbPath];
        
#if DEBUG
        // デバッグ時のみSQLiteの実行をトレースする
        self.db.traceExecution = YES;
#endif
    }
    return self;
}

// MARK: - helper

- (BOOL)dbOpen {
    return [self.db open];
}
- (BOOL)dbClose {
    return [self.db close];
}
@end
