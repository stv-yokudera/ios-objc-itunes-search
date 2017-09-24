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
