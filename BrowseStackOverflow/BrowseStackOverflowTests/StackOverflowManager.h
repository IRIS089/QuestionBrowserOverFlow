//
//  StackOverflowManager.h
//  BrowseStackOverflow
//
//  Created by William Cleeton on 6/29/13.
//  Copyright (c) 2013 Ryan Cleeton. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StackOverflowManagerDelegate.h"
#import "StackOverflowCommunicator.h"
#import "Topic.h"
#import "QuestionBuilder.h"

@interface StackOverflowManager : NSObject 

@property (weak, nonatomic) id<StackOverflowManagerDelegate> delegate;
@property (strong) StackOverflowCommunicator *communicator;
@property (strong) QuestionBuilder *questionBuilder;

-(void)fetchQuestionsOnTopic:(Topic *)topic;
-(void)searchingForQuestionsFailedWithError:(NSError *)error;
-(void)receivedQuestionsJSON:(NSString *)objectNotation;


extern NSString *StackOverflowManagerError;
extern NSString *StackOverflowManagerSearchFailedError;

enum{StackOverflowManagerErrorQuestionSearchCode};

@end
