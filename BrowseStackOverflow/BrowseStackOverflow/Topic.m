//
//  Topic.m
//  BrowseStackOverflow
//
//  Created by William Cleeton on 6/27/13.
//  Copyright (c) 2013 Ryan Cleeton. All rights reserved.
//

#import "Topic.h"

@implementation Topic{
    NSArray *questions;
}

-(id)initWithName:(NSString *)newName tag:(NSString *)tag{
    if(self = [super init]){
        _name = [newName copy];
        _tag = [tag copy];
    }
    return self;
}

-(NSArray *)sortQuestionsLatestFirst:(NSArray *)questionList{
    return [questionList sortedArrayUsingComparator:^(id obj1, id obj2){
        Question *q1 = [[Question alloc] init];
        Question *q2 = [[Question alloc] init];
        return [q2.date compare:q1.date];
    }];
}

-(NSArray *)recentQuestions{
    return [self sortQuestionsLatestFirst:questions];
}

-(void)addQuestion:(Question *)question{
    questions = [questions arrayByAddingObject:question];
    NSArray *newQuestions = [questions arrayByAddingObject:question];
    if([newQuestions count] > 20){
        newQuestions = [self sortQuestionsLatestFirst:newQuestions];
        newQuestions = [newQuestions subarrayWithRange:NSMakeRange(0, 20)]; 
    }
}

@end
