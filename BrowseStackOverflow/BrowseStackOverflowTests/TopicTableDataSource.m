//
//  EmptyTableViewDataSource.m
//  BrowseStackOverflow
//
//  Created by William Cleeton on 7/11/13.
//  Copyright (c) 2013 Ryan Cleeton. All rights reserved.
//

#import "TopicTableDataSource.h"

@implementation TopicTableDataSource

@synthesize topics;

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSParameterAssert(section == 0);
    return [topics count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return nil;
}

-(void)setTopics:(NSArray *)newTopics{
    topics = newTopics;
}


@end
