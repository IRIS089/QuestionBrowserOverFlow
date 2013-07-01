//
//  FakeQuestionBuilder.m
//  BrowseStackOverflow
//
//  Created by William Cleeton on 6/30/13.
//  Copyright (c) 2013 Ryan Cleeton. All rights reserved.
//

#import "FakeQuestionBuilder.h"
#import "Question.h"

@implementation FakeQuestionBuilder

-(NSArray *)questionsFromJSON:(NSString *)objectNotation error:(NSError **)error{
    self.JSON = objectNotation;
    return _arrayToReturn;
}



@end
