//
//  TopicTableViewDataSourcesTests.m
//  BrowseStackOverflow
//
//  Created by William Cleeton on 7/11/13.
//  Copyright (c) 2013 Ryan Cleeton. All rights reserved.
//

#import "TopicTableViewDataSourceTests.h"
#import "TopicTableDataSource.h"
#import "Topic.h"

@implementation TopicTableViewDataSourceTests{
    TopicTableDataSource *dataSource;
    NSArray *topicsList;
}

-(void)setUp{
    dataSource = [[TopicTableDataSource alloc] init];
    Topic *sampleTopic = [[Topic alloc] initWithName:@"iPhone" tag:@"iphone"];
    topicsList = [NSArray arrayWithObject:sampleTopic];
    [dataSource setTopics:topicsList];
}

-(void)tearDown{
    dataSource = nil;
    topicsList = nil;
}

-(void)testTopicDataSourceCanReceiveAListOfTopics{
    STAssertNoThrow([dataSource setTopics:topicsList], @"The data source needs a list of topics");
}

-(void)testOneTableRowForOneTopic{
    STAssertEquals((NSInteger)[topicsList count], [dataSource tableView:nil numberOfRowsInSection:0], @"As there's one topic, there should be one row in the table");
}

-(void)testTwoTableRowsForTwoTopics{
    Topic *topic1 = [[Topic alloc] initWithName:@"Mac OS X" tag:@"macosx"];
    Topic *topic2 = [[Topic alloc] initWithName:@"Cocoa" tag:@"cocoa"];
    
    NSArray *twoTopicList = [NSArray arrayWithObjects:topic1, topic2, nil];
    [dataSource setTopics:twoTopicList];
    STAssertEquals((NSInteger)[twoTopicList count], [dataSource tableView:nil numberOfRowsInSection:0], @"There should be two rows in the table for two topics");
}
@end
