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

-(void)testOneSectionInTheTableView{
    STAssertThrows([dataSource tableView:nil numberOfRowsInSection:1], @"Data Source doesn't allow asking about additional sections");
}

-(void)testDataSourceCellCreationExpectsOneSection{
    NSIndexPath *secondSection = [NSIndexPath indexPathForRow:0 inSection:1];
    STAssertThrows([dataSource tableView:nil cellForRowAtIndexPath:secondSection], @"Data source will not prepare cells for unexpected sections");
}

-(void)testDataSourceCellCreationWillNotCreateMoreRowsThanItHasTopics{
    NSIndexPath *afterLastTopic = [NSIndexPath indexPathForRow:[topicsList count] inSection:0];
    STAssertThrows([dataSource tableView:nil cellForRowAtIndexPath:afterLastTopic], @"Data source will not prepare more cells than there are topics");
}
@end
