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

@interface StackOverflowManager : NSObject 

@property (weak, nonatomic) id<StackOverflowManagerDelegate> delegate;
@property (strong) StackOverflowCommunicator *communicator;

-(void)fetchQuestionsOnTopic:(Topic *)topic;

@end
