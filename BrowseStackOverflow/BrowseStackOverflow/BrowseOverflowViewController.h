//
//  BrowseOverflowViewController.h
//  BrowseStackOverflow
//
//  Created by William Cleeton on 7/11/13.
//  Copyright (c) 2013 Ryan Cleeton. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BrowseOverflowViewController : UIViewController

@property (strong) UITableView *tableView;
@property (strong) id <UITableViewDataSource> dataSource;
@property (strong) id <UITableViewDelegate> tableViewDelegate;

@end
