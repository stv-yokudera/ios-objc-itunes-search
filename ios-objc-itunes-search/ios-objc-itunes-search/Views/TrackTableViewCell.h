//
//  TrackTableViewCell.h
//  ios-objc-itunes-search
//
//  Created by OkuderaYuki on 2017/09/24.
//  Copyright © 2017年 YukiOkudera. All rights reserved.
//

#import <UIKit/UIKit.h>

static const CGFloat TrackTableViewCellHeight = 44.0;

@interface TrackTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *trackNameLabel;
@end
