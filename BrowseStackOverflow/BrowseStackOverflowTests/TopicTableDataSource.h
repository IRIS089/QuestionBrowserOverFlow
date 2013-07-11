//
//  EmptyTableViewDataSource.h
//  BrowseStackOverflow
//
//  Created by William Cleeton on 7/11/13.
//  Copyright (c) 2013 Ryan Cleeton. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TopicTableDataSource : NSObject <UITableViewDataSource>

@property (nonatomic) NSArray *topics;

-(void)setTopics:(NSArray *)newTopics;

@end
