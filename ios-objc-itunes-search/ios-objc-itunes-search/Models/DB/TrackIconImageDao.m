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

#pragma mark - CREATE TABLE

+ (BOOL)createTrackIconImageTable {
    
    NSString *sql = @"CREATE TABLE IF NOT EXISTS TrackIconImage (trackId INTEGER PRIMARY KEY, imageData BLOB)";
    
    BOOL result = NO;
    
    [[SQLiteHelper shared] dbOpen];
    result = [[SQLiteHelper shared].db executeUpdate:sql];
    [[SQLiteHelper shared] dbClose];
    return result;
}

#pragma mark - INSERT

+ (void)insert:(TrackIconImage *)newObject {
    NSString *sql = @"INSERT INTO TrackIconImage (trackId, imageData) values (?, ?)";
    
    NSNumber *trackIdNum = [NSNumber numberWithInteger:newObject.trackId];
    [[SQLiteHelper shared] dbOpen];
    [[SQLiteHelper shared].db executeUpdate:sql
                               withArgumentsInArray:@[trackIdNum, newObject.imageData]];
    [[SQLiteHelper shared] dbClose];
}

#pragma mark - SELECT

+ (UIImage *)selectByTrackId:(NSInteger)trackId {
    NSString *sql = @"SELECT * FROM TrackIconImage WHERE trackId = ?";
    
    NSNumber *trackIdNum = [NSNumber numberWithInteger:trackId];
    [[SQLiteHelper shared] dbOpen];
    FMResultSet *resultSet = [[SQLiteHelper shared].db executeQuery:sql
                                                       withArgumentsInArray:@[trackIdNum]];
    
    NSData *imageData;
    while([resultSet next]) {
        imageData = [resultSet dataForColumn:@"imageData"];
    }
    [[SQLiteHelper shared] dbClose];
    
    return [[UIImage alloc] initWithData:imageData];
}

@end
