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

/**
 SQLiteHelperのシングルトンインスタンスを生成する
 */
+ (SQLiteHelper *)shared {
    static SQLiteHelper *sharedInstance = nil;
    static dispatch_once_t onceToken = 0;
    dispatch_once(&onceToken, ^{
        sharedInstance = [SQLiteHelper new];
        sharedInstance.db = [self createFMDatabase];
    });
    
    return sharedInstance;
}

/**
 FMDatabaseのインスタンスを生成する
 */
+ (FMDatabase *)createFMDatabase {
    NSString *dbPath = [FilePath dbPath];
    Dlog(@"dbPath: %@", dbPath);
    FMDatabase *db = [[FMDatabase alloc] initWithPath:dbPath];
    
    // デバッグ時のみSQLiteの実行をトレースする
#if DEBUG
    db.traceExecution = YES;
#endif
    
    return db;
}

// MARK: - SQLite Helper Methods

- (BOOL)dbOpen {
    return [self.db open];
}
- (BOOL)dbClose {
    return [self.db close];
}
@end
