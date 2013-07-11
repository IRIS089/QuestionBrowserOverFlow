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

-(Topic *)topicForIndexPath:(NSIndexPath *)indexPath{
    return [topics objectAtIndex:[indexPath row]];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSParameterAssert(section == 0);
    return [topics count];
}

NSString *topicCellReuseIdentifier = @"Topic";

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSParameterAssert([indexPath section] == 0);
    NSParameterAssert([indexPath row] < [topics count]);
    UITableViewCell *topicCell = [tableView dequeueReusableCellWithIdentifier:topicCellReuseIdentifier];
    if (!topicCell) {
        topicCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:topicCellReuseIdentifier];

    }
    topicCell.textLabel.text = [[topics objectAtIndex:[indexPath row]] name];
    return topicCell;
}

-(void)setTopics:(NSArray *)newTopics{
    topics = newTopics;
}

    

@end
