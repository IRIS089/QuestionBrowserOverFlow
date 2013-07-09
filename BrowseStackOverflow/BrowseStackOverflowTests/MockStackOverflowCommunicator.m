//
//  MockStackOverflowCommunicator.m
//  BrowseStackOverflow
//
//  Created by William Cleeton on 6/30/13.
//  Copyright (c) 2013 Ryan Cleeton. All rights reserved.
//

#import "MockStackOverflowCommunicator.h"

@implementation MockStackOverflowCommunicator {
    BOOL wasAskedToFetchQuestions;
}
-(void)searchForQuestionsWithTag:(NSString *)tag{
    wasAskedToFetchQuestions = YES;
}
-(BOOL)wasAskedToFetchQuestions{
    return wasAskedToFetchQuestions;
}



@end
