//
//  EmptyTableViewDelegate.h
//  BrowseStackOverflow
//
//  Created by William Cleeton on 7/11/13.
//  Copyright (c) 2013 Ryan Cleeton. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TopicTableDataSource;

@interface TopicTableDelegate : NSObject <UITableViewDelegate>

@property (strong) TopicTableDataSource *tableDataSource;

@end
