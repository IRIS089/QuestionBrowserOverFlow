//
//  MockStackOverflowManagerDelegate.m
//  BrowseStackOverflow
//
//  Created by William Cleeton on 6/30/13.
//  Copyright (c) 2013 Ryan Cleeton. All rights reserved.
//

#import "MockStackOverflowManagerDelegate.h"

@implementation MockStackOverflowManagerDelegate

-(void)fetchingQuestionsFailedWithError:(NSError *)error{
    _fetchError = error;
}

-(void)fetchingQuestionsOnTopic:(Topic *)topic failedWithError:(NSError *)error{
    _fetchError = error;
}

-(void)didRecieveQuestions:(NSArray *)questions{
    _receivedQuestions =questions;
}

@end
