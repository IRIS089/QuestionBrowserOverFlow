//
//  QuestionBuilder.m
//  BrowseStackOverflow
//
//  Created by William Cleeton on 6/30/13.
//  Copyright (c) 2013 Ryan Cleeton. All rights reserved.
//

#import "QuestionBuilder.h"

@implementation QuestionBuilder

-(NSArray *)questionsFromJSON:(NSString *)objectNotation error:(NSError **)error{
    NSParameterAssert(objectNotation != nil);
    NSData *unicodeNotation = [objectNotation dataUsingEncoding:NSUTF8StringEncoding];
    NSError *localError = nil;
    id jsonObject = [NSJSONSerialization JSONObjectWithData:unicodeNotation options:0 error:&localError];
    NSDictionary *parsedObject = (id)jsonObject;
    if(parsedObject == nil){
        if(error != NULL){
            *error = [NSError errorWithDomain:QuestionBuilderErrorDomain code:QuestionBuilderInvalidJSONError userInfo:nil];
        }
        return nil;
    }
    NSArray *questions = [parsedObject objectForKey:@"questions"];
    if(questions == nil){
        if(error != NULL){
            *error = [NSError errorWithDomain:QuestionBuilderErrorDomain code:QuestionBuilderMissingDataError userInfo:nil];
        }
        return nil;
    }
    return nil;
}

@end

NSString *QuestionBuilderErrorDomain = @"QuestionBuilderErrorDomain";



