//
//  StackOverflowCommunicatorTests.m
//  BrowseStackOverflow
//
//  Created by William Cleeton on 7/3/13.
//  Copyright (c) 2013 Ryan Cleeton. All rights reserved.
//

#import "StackOverflowCommunicatorTests.h"
#import "InspectableStackOverflowCommunicator.h"
#import "NonNetworkedStackOverflowCommunicator.h"
#import "MockStackOverflowCommunicator.h"


@implementation StackOverflowCommunicatorTests{
@private
    InspectableStackOverflowCommunicator *communicator;
    NonNetworkedStackOverflowCommunicator *nnCommunicator;
    MockStackOverflowCommunicator *manager;
}
-(void)setUp{
    communicator = [[InspectableStackOverflowCommunicator alloc] init];
    nnCommunicator = [[NonNetworkedStackOverflowCommunicator alloc] init];
    manager = [[MockStackOverflowCommunicator alloc] init];
    nnCommunicator.delegate = manager;
    fourOhFourResponse = [[FakeURLResponse alloc] initWithStatusCode:404];
    receivedData = [@"Result" dataUsingEncoding:NSUTF8StringEncoding];
    
}

-(void)tearDown{
    [communicator cancelAndDiscardURLConnection];
    communicator = nil;
    nnCommunicator = nil;
    manager = nil;
    fourOhFourResponse = nil;
    receivedData = nil;
}

-(void)testSearchingForQuestionsOnTopicCallsTopicAPI{
    [communicator searchForQuestionsWithTag:@"ios"];
    STAssertEqualObjects([[communicator URLToFetch] absoluteString], @"http://api.stackoverflow.com/1.1/search?tagged=ios&pagesize=20", @"Use the search API to find questions with a particular tag");
}

-(void)testFillingInQuestionBodyCallsQuestionAPI{
    [communicator downloadAnswersToQuestionWithID:12345];
    STAssertEqualObjects([[communicator URLToFetch] absoluteString], @"http://api.stackoverflow.com/1.1/questions/12345?body=true", @"Use the question API to get the body for a question");
}

-(void)testFetchingAnswersToQuestionCallsQuestionAPI{
    [communicator downloadAnswersToQuestionWithID:12345];
    STAssertEqualObjects([[communicator URLToFetch] absoluteString], @"http://api.stackoverflow.com/1.1/questions/12345/answers?body=true", @"Use the question API to get answers on a given question");
}

-(void)testSearchingForQuestionsCreatesURLConnection{
    [communicator searchForQuestionsWithTag:@"ios"];
    STAssertNotNil([communicator currentURLConnection], @"There should be a URL connection in-flight now.");
    [communicator cancelAndDiscardURLConnection];
}

-(void)testStartingSearchThrowsOutOldConnection{
    [communicator searchForQuestionsWithTag:@"ios"];
    NSURLConnection *firstConnection = [communicator currentURLConnection];
    [communicator searchForQuestionsWithTag:@"cocoa"];
    STAssertFalse([[communicator currentURLConnection] isEqual:firstConnection],@"The communicator needs to replace its URL connection to start a new one" );
    [communicator cancelAndDiscardURLConnection];
}

-(void)testReceivingResponseWith404StatusPassesErrorToDelegate{
    [nnCommunicator searchForQuestionsWithTag:@"ios"];
    [nnCommunicator connection:nil didReceiveResponse:(NSURLResponse *)fourOhFourResponse];
    STAssertEquals([manager topicFailureErrorCode], 404, @"Fetch failure was passed through to delegate");
}

-(void)testNoErrorReceivedOn200Status{
    FakeURLResponse *twoHundredResponse = [[FakeURLResponse alloc] initWithStatusCode:200];
    [nnCommunicator searchForQuestionsWithTag:@"ios"];
    [nnCommunicator connection:nil didReceiveResponse:(NSURLResponse *)twoHundredResponse];
    STAssertFalse([manager topicFailureErrorCode] == 200, @"No need for error on 200 response");
}

-(void)testConnection
@end
