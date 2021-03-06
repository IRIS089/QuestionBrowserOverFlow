//
//  QuestionBuilder.h
//  BrowseStackOverflow
//
//  Created by William Cleeton on 6/30/13.
//  Copyright (c) 2013 Ryan Cleeton. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Question;

@interface QuestionBuilder : NSObject

-(NSArray *)questionsFromJSON:(NSString *)objectNotation error:(NSError **)error;
-(NSArray *)fillInDetailsForQuestion:(Question *)question fromJSON:(NSString *)JSON;

extern NSString *QuestionBuilderErrorDomain;

enum{
    QuestionBuilderInvalidJSONError,
    QuestionBuilderMissingDataError,
};

@end
