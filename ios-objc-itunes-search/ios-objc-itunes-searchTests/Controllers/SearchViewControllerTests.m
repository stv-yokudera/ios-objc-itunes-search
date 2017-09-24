//
//  SearchViewControllerTests.m
//  ios-objc-itunes-searchTests
//
//  Created by OkuderaYuki on 2017/09/25.
//  Copyright © 2017年 YukiOkudera. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ItunesSearchAPI.h"
#import "SearchViewController.h"

@interface SearchViewController (SearchViewControllerTestsPrivate)
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic) ItunesSearchAPI *searchAPI;
@end

@interface SearchViewControllerTests : XCTestCase
@property (nonatomic) SearchViewController *searchViewController;
@end

@implementation SearchViewControllerTests

- (void)setUp {
    [super setUp];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"SearchViewController" bundle:nil];
    
    UINavigationController *navigationController = (UINavigationController *)[storyboard instantiateInitialViewController];
    self.searchViewController = (SearchViewController *)navigationController.topViewController;
    [self.searchViewController performSelectorOnMainThread:@selector(loadView) withObject:nil waitUntilDone:YES];
    [self.searchViewController viewDidLoad];
}

- (void)testUISearchBarDelegate {
    XCTAssertNotNil(self.searchViewController.searchBar.delegate);
}

- (void)testUITableViewDelegate {
    XCTAssertNotNil(self.searchViewController.tableView.delegate);
}

- (void)testUITableViewDataSource {
    XCTAssertNotNil(self.searchViewController.tableView.dataSource);
}

- (void)testItunesSearchLoadable {
    XCTAssertNotNil(self.searchViewController.searchAPI.loadable);
}

- (void)testDefaultNavigationTitle {
    XCTAssertEqualObjects(self.searchViewController.navigationItem.title, @"音楽検索");
}

- (void)testDefaultSearchBarText {
    XCTAssertEqualObjects(self.searchViewController.searchBar.text, @"");
}

@end
