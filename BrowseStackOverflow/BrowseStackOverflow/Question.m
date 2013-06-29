//
//  Question.m
//  BrowseStackOverflow
//
//  Created by William Cleeton on 6/27/13.
//  Copyright (c) 2013 Ryan Cleeton. All rights reserved.
//

#import "Question.h"
#import "Answer.h"

@implementation Question

-(id)init{
    if((self = [super init])) {
        answerSet = [[NSMutableSet alloc] init];
    }
    return self;
}

-(void)addAnswer:(Answer *)answer{
    [answerSet addObject:answer];
}

-(NSArray *)answers{
    return [[answerSet allObjects] sortedArrayUsingSelector:@selector(compare:)];
}

@end
