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

@interface TracksProvider ()
@property (nonatomic, readwrite)NSArray <Track *> *tracks;
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
            } else {
                // DBから画像を取得できなかった場合は、URLから画像を取得して、DBに登録する
                dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                    NSString *imageURL = self.tracks[indexPath.row].artworkUrl100;
                    NSData *imageData = [NSData dataWithContentsOfURL: [NSURL URLWithString: imageURL]];
                    UIImage *image = [UIImage imageWithData:imageData];
                    TrackIconImage *trackIconImage = [[TrackIconImage alloc] initWithTrackId:self.tracks[indexPath.row].trackId
                                                                                   imageData:[[NSData alloc] initWithData:imageData]];
                    [TrackIconImageDao insert:trackIconImage];
                    
                    dispatch_async(dispatch_get_main_queue(), ^{
                        cell.iconImageView.image = image;
                        [cell layoutSubviews];
                    });
                });
            }
            
            return cell;
        }
            
        case CellTypeEmpty: {
            EmptyTableViewCell *cell = (EmptyTableViewCell *)[tableView dequeueReusableCellWithIdentifier:[EmptyTableViewCell identifier]
                                                                                             forIndexPath:indexPath];
            return cell;
        }
    }
}

@end
