//
//  SearchViewController.m
//  ios-objc-itunes-search
//
//  Created by OkuderaYuki on 2017/09/24.
//  Copyright © 2017年 YukiOkudera. All rights reserved.
//

#import "ItunesSearchAPI.h"
#import "SearchViewController.h"
#import "SVProgressHUD.h"
#import "TracksProvider.h"
#import "TrackTableViewCell.h"

@interface SearchViewController () <ItunesSearchLoadable, UISearchBarDelegate, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic) ItunesSearchAPI *searchAPI;
@property (nonatomic) TracksProvider *provider;

@end

@implementation SearchViewController

#pragma mark - view life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

#pragma mark - private methods
- (void)setup {
    Dlog()
    self.searchBar.showsCancelButton = YES;
    
    self.searchAPI = [ItunesSearchAPI new];
    self.searchAPI.loadable = self;
    
    self.provider = [TracksProvider new];
    self.tableView.tableFooterView = [UIView new];
    self.tableView.dataSource = self.provider;
}

- (void)showAlertWithMessage:(NSString *)message {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"エラー"
                                                                   message:message
                                                            preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK"
                                                       style:UIAlertActionStyleDefault
                                                     handler:nil];
    [alert addAction:okAction];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)clearList {
    Dlog()
    self.searchBar.text = @"";
    self.navigationItem.title = @"音楽検索";
    [self.provider set:@[]];
    [self.tableView reloadData];
}

#pragma mark - ItunesSearchLoadable

- (void)loaded:(ItunesSearchResponse *)response {
    Dlog()
    self.navigationItem.title = response.results.firstObject.artistName;
    [self.provider set:response.results];
    [self.tableView reloadData];
    [SVProgressHUD dismiss];
}

- (void)offline {
    Dlog()
    [self showAlertWithMessage:@"通信環境の良い場所で再度お試しください。"];
    [self clearList];
    [SVProgressHUD dismiss];
}

- (void)emptyData {
    Dlog()
    [self showAlertWithMessage:@"該当の音楽がみつかりません。"];
    [self clearList];
    [SVProgressHUD dismiss];
}

- (void)error {
    Dlog()
    [self showAlertWithMessage:@"検索に失敗しました。"];
    [self clearList];
    [SVProgressHUD dismiss];
}

#pragma mark - UISearchBarDelegate

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [SVProgressHUD show];
    [searchBar resignFirstResponder];
    [self.searchAPI loadWithTerm:searchBar.text];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    if (searchBar.canResignFirstResponder) {
        [searchBar resignFirstResponder];
    }
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([self.provider cellType] == CellTypeTrack) {
        return TrackTableViewCellHeight;
    }
    return self.tableView.frame.size.height;
}
@end
