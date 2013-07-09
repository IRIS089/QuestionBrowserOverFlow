//
//  StackOverflowManager.m
//  BrowseStackOverflow
//
//  Created by William Cleeton on 6/29/13.
//  Copyright (c) 2013 Ryan Cleeton. All rights reserved.
//

#import "StackOverflowManager.h"

@implementation StackOverflowManager

@synthesize delegate;

-(void)setDelegate:(id<StackOverflowManagerDelegate>)newDelegate{
    if(newDelegate && ![newDelegate conformsToProtocol:@protocol(StackOverflowManagerDelegate)]){
        [[NSException exceptionWithName:NSInvalidArgumentException reason:@"Delegate object does not conform to the delegate protocol" userInfo:nil] raise];
    }
    delegate = newDelegate;
}

-(void)fetchQuestionsOnTopic:(Topic *)topic{
    [_communicator searchForQuestionsWithTag:[topic tag]];
}

-(void)searchingForQuestionsFailedWithError:(NSError *)error{
    NSDictionary *errorInfo = [NSDictionary dictionaryWithObject:error forKey:NSUnderlyingErrorKey];
    NSError *reportableError = [NSError errorWithDomain:StackOverflowManagerSearchFailedError code:StackOverflowManagerErrorQuestionSearchCode userInfo:errorInfo];
    [delegate fetchingQuestionsOnTopic:nil failedWithError:reportableError];
}

-(void)receivedQuestionsJSON:(NSString *)objectNotation{
    NSError *error = nil;
    NSArray *questions = [_questionBuilder questionsFromJSON:objectNotation error:&error];
    if(!questions){
        NSDictionary *errorInfo = nil;
        if(error){
            errorInfo = [NSDictionary dictionaryWithObject:error forKey:NSUnderlyingErrorKey];
        }
        NSError *reportableError = [NSError errorWithDomain:StackOverflowManagerSearchFailedError code:StackOverflowManagerErrorQuestionSearchCode userInfo:errorInfo];
        [delegate fetchingQuestionsFailedWithError:reportableError];
    }else{
        [delegate didRecieveQuestions:questions];
    }
}




@end


NSString *StackOverflowManagerSearchFailedError = @"StackOverflowManagerSearchFailedError";