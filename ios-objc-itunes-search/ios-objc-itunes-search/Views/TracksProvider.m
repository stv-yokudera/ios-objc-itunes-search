//
//  TracksProvider.m
//  ios-objc-itunes-search
//
//  Created by OkuderaYuki on 2017/09/24.
//  Copyright © 2017年 YukiOkudera. All rights reserved.
//

#import "EmptyTableViewCell.h"
#import "TrackIconImageDao.h"
#import "TracksProvider.h"
#import "TrackTableViewCell.h"

#import "UITableViewCell+Identifier.h"

typedef void (^ImageDownloadCompletionHandler)(UIImage *result);

@interface TracksProvider ()
@property (nonatomic, readwrite) NSArray <Track *> *tracks;
@end

@implementation TracksProvider

- (void)set:(NSArray <Track *> *)tracks {
    self.tracks = tracks;
}

- (CellType)cellType {
    if (self.tracks.count == 0) {
        return CellTypeEmpty;
    }
    return CellTypeTrack;
}

- (NSString *)cellIdentifier {
    switch (self.cellType) {
        case CellTypeTrack:
            return [TrackTableViewCell identifier];

        case CellTypeEmpty:
            return [EmptyTableViewCell identifier];
    }
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.tracks.count == 0) {
        return 1;
    }
    return self.tracks.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    switch ([self cellType]) {
        case CellTypeTrack: {
            TrackTableViewCell *cell = (TrackTableViewCell *)[tableView dequeueReusableCellWithIdentifier:[TrackTableViewCell identifier]
                                                                                             forIndexPath:indexPath];
            cell.trackNameLabel.text = self.tracks[indexPath.row].trackName;
            
            cell.iconImageView.image = nil;
            
            // DBから画像を取得する
            UIImage *savedImage = [TrackIconImageDao selectByTrackId:self.tracks[indexPath.row].trackId];
            if (savedImage) {
                cell.iconImageView.image = savedImage;
                [cell layoutSubviews];
                return cell;
            }
            // DBから画像を取得できなかった場合は、URLから画像を取得して、DBに登録する
            [self downloadImageAtIndexPath:indexPath completionHandler:^(UIImage *result) {
                cell.iconImageView.image = result;
                [cell layoutSubviews];
            }];
            
            return cell;
        }
            
        case CellTypeEmpty: {
            EmptyTableViewCell *cell = (EmptyTableViewCell *)[tableView dequeueReusableCellWithIdentifier:[EmptyTableViewCell identifier]
                                                                                             forIndexPath:indexPath];
            return cell;
        }
    }
}

#pragma mark - private methods

/**
 非同期で画像をダウンロードして、DBに登録する

 @param indexPath (NSIndexPath *) 画像を表示する対象のCellのIndexPath
 @param completionHandler (void (^)(UIImage *result)) ダウンロード完了時の処理
 */
- (void)downloadImageAtIndexPath:(NSIndexPath *)indexPath
               completionHandler:(ImageDownloadCompletionHandler)completionHandler {
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        Track *targetTrack = self.tracks[indexPath.row];
        NSURL *imageUrl = [NSURL URLWithString: targetTrack.artworkUrl100];
        NSData *imageData = [NSData dataWithContentsOfURL: imageUrl];
        UIImage *image = [UIImage imageWithData:imageData];
        TrackIconImage *trackIconImage = [[TrackIconImage alloc] initWithTrackId:targetTrack.trackId
                                                                       imageData:imageData];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [TrackIconImageDao insert:trackIconImage];
            completionHandler(image);
        });
    });
}

@end
