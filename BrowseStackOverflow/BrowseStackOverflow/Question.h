//
//  Question.h
//  BrowseStackOverflow
//
//  Created by William Cleeton on 6/27/13.
//  Copyright (c) 2013 Ryan Cleeton. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

@class Answer;

@interface Question : NSObject{
    NSMutableSet *answerSet;
}

@property (readwrite) NSDate *date;
@property (readwrite) NSInteger score;
@property (readwrite) NSString *title;
@property (readonly) NSArray *answers;
@property (readwrite) NSInteger questionID;
@property (readwrite) Person *asker;
@property (readwrite) NSString *body;

-(void)addAnswer:(Answer *)answer;

@end
