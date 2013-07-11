//
//  BrowseOverflowViewController.h
//  BrowseStackOverflow
//
//  Created by William Cleeton on 7/11/13.
//  Copyright (c) 2013 Ryan Cleeton. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TopicTableDataSource.h"
#import "TopicTableDelegate.h"

@interface BrowseOverflowViewController : UIViewController

@property (strong) UITableView *tableView;
@property (strong) TopicTableDataSource *dataSource;
@property (strong) TopicTableDelegate *tableViewDelegate;

@end
