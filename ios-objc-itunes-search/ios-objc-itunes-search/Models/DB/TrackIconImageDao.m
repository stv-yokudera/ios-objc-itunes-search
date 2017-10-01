//
//  TrackIconImageDao.m
//  ios-objc-itunes-search
//
//  Created by OkuderaYuki on 2017/09/24.
//  Copyright © 2017年 YukiOkudera. All rights reserved.
//

#import "TrackIconImageDao.h"
#import "SQLiteHelper.h"

@implementation TrackIconImageDao

// MARK: - CREATE TABLE

+ (BOOL)createTrackIconImageTable {
    
    NSString *sql = @"CREATE TABLE IF NOT EXISTS TrackIconImage (trackId INTEGER PRIMARY KEY, imageData BLOB)";
    
    BOOL result = NO;
    
    SQLiteHelper *sqliteHelper = [SQLiteHelper new];
    [sqliteHelper dbOpen];
    result = [sqliteHelper.db executeUpdate:sql];
    [sqliteHelper dbClose];
    return result;
}

// MARK: - INSERT

+ (void)insert:(TrackIconImage *)newObject {
    NSString *sql = @"INSERT INTO TrackIconImage (trackId, imageData) values (?, ?)";
    
    NSNumber *trackIdNum = [NSNumber numberWithInteger:newObject.trackId];
    SQLiteHelper *sqliteHelper = [SQLiteHelper new];
    [sqliteHelper dbOpen];
    [sqliteHelper.db executeUpdate:sql withArgumentsInArray:@[trackIdNum, newObject.imageData]];
    [sqliteHelper dbClose];
}

// MARK: - SELECT

+ (UIImage *)selectByTrackId:(NSInteger)trackId {
    NSString *sql = @"SELECT * FROM TrackIconImage WHERE trackId = ?";
    
    NSNumber *trackIdNum = [NSNumber numberWithInteger:trackId];
    SQLiteHelper *sqliteHelper = [SQLiteHelper new];
    [sqliteHelper dbOpen];
    FMResultSet *resultSet = [sqliteHelper.db executeQuery:sql withArgumentsInArray:@[trackIdNum]];
    
    NSData *imageData;
    while([resultSet next]) {
        imageData = [resultSet dataForColumn:@"imageData"];
    }
    [sqliteHelper dbClose];
    
    return [[UIImage alloc] initWithData:imageData];
}

@end
