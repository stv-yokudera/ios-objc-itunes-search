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
        Dlog(@"dbPath: %@", [FilePath dbPath]);
        self.db = [[FMDatabase alloc] initWithPath:[FilePath dbPath]];
        
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

// MARK: - CREATE TABLE

/**
 TrackIconImageテーブルが存在しなければ作成する
 
 @return 成功 or 失敗
 */
- (BOOL)createTrackIconImageTable {
    
    NSString *sql = @"CREATE TABLE IF NOT EXISTS TrackIconImage (trackId INTEGER PRIMARY KEY, imageData BLOB)";
    
    BOOL result = NO;
    
    [self dbOpen];
    result = [self.db executeUpdate:sql];
    [self dbClose];
    return result;
}
@end
