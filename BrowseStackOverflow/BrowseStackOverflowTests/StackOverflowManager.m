//
//  StackOverflowManager.m
//  BrowseStackOverflow
//
//  Created by William Cleeton on 6/29/13.
//  Copyright (c) 2013 Ryan Cleeton. All rights reserved.
//

#import "StackOverflowManager.h"

@implementation StackOverflowManager

-(void)setDelegate:(id<StackOverflowManagerDelegate>)newDelegate{
    if(newDelegate && ![newDelegate conformsToProtocol:@protocol(StackOverflowManagerDelegate)]){
        [[NSException exceptionWithName:NSInvalidArgumentException reason:@"Delegate object does not conform to the delegate protocol" userInfo:nil] raise];
    }
    _delegate = newDelegate;
}

-(void)fetchQuestionsOnTopic:(Topic *)topic{
    [_communicator searchForQuestionWithTag:[topic tag]];
}

-(void)searchingForQuestionsFailedWithError:(NSError *)error{
    NSDictionary *errorInfo = [NSDictionary dictionaryWithObject:error forKey:NSUnderlyingErrorKey];
    NSError *underlyingError = [NSError errorWithDomain:StackOverflowManagerSearchFailedError code:StackOverflowManagerErrorQuestionSearchCode userInfo:errorInfo];
    [_delegate fetchingQuestionsFailedWithError:underlyingError];
}

-(void)receivedQuestionsJSON:(NSString *)objectNotation{
    NSArray *questions = [_questionBuilder questionsFromJSON:objectNotation error:NULL];
}

@end

NSString *StackOverflowManagerError = @"StackOverflowManagerError";
NSString *StackOverflowManagerSearchFailedError = @"StackOverflowManagerSearchFailedError";