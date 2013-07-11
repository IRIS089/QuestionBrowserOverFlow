//
//  StackOverflowCommunicatorTests.h
//  BrowseStackOverflow
//
//  Created by William Cleeton on 7/3/13.
//  Copyright (c) 2013 Ryan Cleeton. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>

@class InspectableStackOverflowCommunicator;
@class NonNetworkedStackOverflowCommunicator;
@class MockStackOverflowManager;
@class FakeURLResponse;

@interface StackOverflowCommunicatorTests : SenTestCase{
    InspectableStackOverflowCommunicator *communicator;
    NonNetworkedStackOverflowCommunicator *nnCommunicator;
    MockStackOverflowManager *manager;
    FakeURLResponse *fourOhFourResponse;
    NSData *receivedData;
}

@end
