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
#import "QuestionBuilder.h"

@implementation QuestionCreationTests{
@private
    StackOverflowManager *mgr;
    MockStackOverflowManagerDelegate *delegate;
    NSError *underlyingError;
    FakeQuestionBuilder *builder;
    NSArray *questionArray;
    //I had to add this questionBuilder because testDelegateNotToldAboutErrorWhenQuestionsReceieved and testDelegateReceivesTheQuestionsDiscoveredBtManager would not compile otherwise.
    FakeQuestionBuilder *questionBuilder;
}

-(void)setUp{
    Question *question = [[Question alloc] init];
    questionArray = [NSArray arrayWithObject:question];
    
    mgr = [[StackOverflowManager alloc] init];
    
    delegate = [[MockStackOverflowManagerDelegate alloc] init];
    mgr.delegate = delegate;
    
    underlyingError = [NSError errorWithDomain:@"Test Domain" code:0 userInfo:nil];
    
    builder = [[FakeQuestionBuilder alloc] init];
    mgr.questionBuilder = builder;
    
    questionBuilder = [[FakeQuestionBuilder alloc] init];
}

-(void)tearDown{
    mgr = nil;
    delegate = nil;
    underlyingError = nil;
    builder = nil;
    questionArray = nil;
    questionBuilder = nil;
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
    Topic *topic = [[Topic alloc] initWithName:@"iPhone" tag:@"iPhoneTag"];
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
    [mgr receivedQuestionsJSON:@"Fake JSON"];
    STAssertEqualObjects(builder.JSON, @"Fake JSON", @"Downloaded JSON is sent to the builder");
    mgr.questionBuilder = nil;
}

-(void)testDelegateIsNotifiedOfErrorWhenQuestionBuilderFails{
    builder.arrayToReturn = nil;
    builder.errorToSet = underlyingError;
    [mgr receivedQuestionsJSON:@"Fake JSON"];
    STAssertNotNil([[[delegate fetchError] userInfo] objectForKey:NSUnderlyingErrorKey], @"The delegate should have found out about the error");
    mgr.questionBuilder = nil;
    
}

-(void)testDelegateNotToldAboutErrorWhenQuestionsReceieved{
    questionBuilder.arrayToReturn = questionArray;
    [mgr receivedQuestionsJSON:@"Fake JSON"];
    STAssertNil([delegate fetchError], @"No error should be received on success");
}

-(void)testDelegateReceivesTheQuestionsDiscoveredBtManager{
    questionBuilder.arrayToReturn = questionArray;
    [mgr receivedQuestionsJSON:@"Fake JSON"];
    STAssertEqualObjects([delegate receivedQuestions], questionArray, @"The manager should have sent its questions to the delegate");
}

@end
