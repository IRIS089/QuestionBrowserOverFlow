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

@end
