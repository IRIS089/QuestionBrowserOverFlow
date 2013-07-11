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



@end
