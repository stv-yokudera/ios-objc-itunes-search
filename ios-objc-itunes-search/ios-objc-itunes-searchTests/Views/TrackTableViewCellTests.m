//
//  TrackTableViewCellTests.m
//  ios-objc-itunes-searchTests
//
//  Created by OkuderaYuki on 2017/09/25.
//  Copyright © 2017年 YukiOkudera. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SearchViewController.h"
#import "TrackTableViewCell.h"

#import "UITableViewCell+Identifier.h"

@interface SearchViewController (TrackTableViewCellTestsPrivate)
@property (nonatomic) IBOutlet UITableView *tableView;
@end

@interface TrackTableViewCellTests : XCTestCase
@property (nonatomic) IBOutlet UITableView *fakeTableView;
@property (nonatomic) SearchViewController *searchViewController;
@property (nonatomic) TrackTableViewCell *cell;
@property (nonatomic) UIView *view;
@end

@implementation TrackTableViewCellTests

- (void)setUp {
    [super setUp];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"SearchViewController" bundle:nil];
    
    UINavigationController *navigationController = (UINavigationController *)[storyboard instantiateInitialViewController];
    self.searchViewController = (SearchViewController *)navigationController.topViewController;
    [self.searchViewController performSelectorOnMainThread:@selector(loadView) withObject:nil waitUntilDone:YES];
    [self setUpTableView];
}

- (void)setUpTableView {
    self.view = self.searchViewController.view;
    self.fakeTableView = self.searchViewController.tableView;
    self.cell = (TrackTableViewCell *)[self.fakeTableView dequeueReusableCellWithIdentifier:[TrackTableViewCell identifier]];
}

- (void)testDefaultItem {
    XCTAssertEqualObjects(self.cell.trackNameLabel.text, @"Label");
    XCTAssertEqualObjects(self.cell.iconImageView.image, nil);
}

- (void)testCellHeight {
    XCTAssertEqual(TrackTableViewCellHeight, 44.0);
}

@end
