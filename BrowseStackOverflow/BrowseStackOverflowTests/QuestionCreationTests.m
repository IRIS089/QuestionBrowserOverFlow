//
//  QuestionCreationTests.m
//  BrowseStackOverflow
//
//  Created by William Cleeton on 6/29/13.
//  Copyright (c) 2013 Ryan Cleeton. All rights reserved.
//

#import "QuestionCreationTests.h"
#import "StackOverflowManager.h"
#import "MockStackOverflowManagerDelegate.h"
#import "Topic.h"
#import "MockStackOverflowCommunicator.h"

@implementation QuestionCreationTests{
    @private StackOverflowManager *mgr;
}

-(void)setUp{
    mgr = [[StackOverflowManager alloc] init];
}

-(void)tearDown{
    mgr = nil;
}

-(void)testNonConformingObjectCannotBeDelegate{
    STAssertThrows(mgr.delegate = (id <StackOverflowManagerDelegate>)[NSNull null], @"NSNull should not be used as the delegate as it doesn't conform to the delegate protocol");
}

-(void)testConformingObjectCanBeDelegate{
    id <StackOverflowManagerDelegate> delegate = [[MockStackOverflowManagerDelegate alloc] init];
    STAssertNoThrow(mgr.delegate = delegate, @"Object conforming to the delegate protocol should be used as the delegate");
}

-(void)testManagerAcceptsNilAsADelegate{
    STAssertNoThrow(mgr.delegate = nil, @"It should be acceptable to use il as an object's delegate");
}

-(void)testAskingForQuestionsMeansRequestData{
    MockStackOverflowCommunicator *communicator = [[MockStackOverflowCommunicator alloc] init];
    mgr.communicator = communicator;
    Topic *topic = [[Topic alloc] initWithName:@"iPhone" tag:@"iphone"];
    [mgr fetchQuestionsOnTopic:topic];
    STAssertTrue([communicator wasAskedToFetchQuestions], @"The communicator should need to fetch data");
}

@end
