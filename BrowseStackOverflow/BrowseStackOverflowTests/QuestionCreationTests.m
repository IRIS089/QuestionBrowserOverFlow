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
#import "FakeQuestionBuilder.h"

@implementation QuestionCreationTests{
    @private
        StackOverflowManager *mgr;
        MockStackOverflowManagerDelegate *delegate;
        NSError *underlyingError;
}

-(void)setUp{
    mgr = [[StackOverflowManager alloc] init];
    delegate = [[MockStackOverflowManagerDelegate alloc] init];
    mgr.delegate = delegate;
    underlyingError = [NSError errorWithDomain:@"Test Domain" code:0 userInfo:nil];
}

-(void)tearDown{
    mgr = nil;
    delegate = nil;
    underlyingError = nil;
}

-(void)testNonConformingObjectCannotBeDelegate{
    STAssertThrows(mgr.delegate = (id <StackOverflowManagerDelegate>)[NSNull null], @"NSNull should not be used as the delegate as it doesn't conform to the delegate protocol");
}

-(void)testConformingObjectCanBeDelegate{
    id <StackOverflowManagerDelegate> overCastedDelegate = mgr.delegate;
    STAssertNoThrow(mgr.delegate = overCastedDelegate, @"Object conforming to the delegate protocol should be used as the delegate");
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

-(void)testErrorReturnedToDelegateIsNotErrorNotifiedByCommunicator{
    [mgr searchingForQuestionsFailedWithError:underlyingError];
    STAssertFalse(underlyingError == [delegate fetchError], @"Error should be at the correct level of abstraction");
}

-(void)testErrorReturnedToDelegateDocumentsUnderlyingError{
    [mgr searchingForQuestionsFailedWithError:underlyingError];
    STAssertEqualObjects([[[delegate fetchError] userInfo] objectForKey:NSUnderlyingErrorKey], underlyingError, @"The underlying error should be available to client code");
}

-(void)testQuestionJSONIsPassedToQuestionBuilder{
    FakeQuestionBuilder *builder = [[FakeQuestionBuilder alloc] init];
    mgr.questionBuilder = builder;
    [mgr receivedQuestionsJSON:@"Fake JSON"];
    STAssertEqualObjects(builder.JSON, @"Fake JSON", @"Downloaded JSON is sent to the builder");
    mgr.questionBuilder = nil;
}

@end
