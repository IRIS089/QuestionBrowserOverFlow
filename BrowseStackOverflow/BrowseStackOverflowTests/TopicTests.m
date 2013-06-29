//
//  TopicTests.m
//  BrowseStackOverflow
//
//  Created by William Cleeton on 6/27/13.
//  Copyright (c) 2013 Ryan Cleeton. All rights reserved.
//

#import "TopicTests.h"
#import "Topic.h"

@implementation TopicTests

-(void)setUp{
    topic = [[Topic alloc] initWithName:@"iPhone" tag:@"iPhoneTag"];
}

-(void)tearDown{
    topic = nil;
}

-(void)testThatTopicExist{
    STAssertNotNil(topic, @"should be able to create a Topic instance");
}

-(void)testThatTopicCanBeNamed{
    STAssertEqualObjects(topic.name, @"iPhone", @"the Topic should have the name I gave it");
}

-(void)testThatTopicHasTag{
    STAssertEqualObjects(topic.tag, @"iPhone", @"Topics should have tags");
    
}

-(void)testForAListOfQuestions{
    STAssertTrue([[topic recentQuestions] isKindOfClass:[NSArray class]], @"Topics should provide with a list of recent Questions");
}

-(void)testForInitialEmptyList{
    STAssertEquals([[topic recentQuestions] count], (NSUInteger)0, @"No questions added to List, count should be zero");
}

-(void)testAddingQuestionToTheList{
    Question *question = [[Question alloc] init];
    [topic addQuestion:question];
    STAssertEquals([[topic recentQuestions] count],  (NSUInteger)0, @"Add a question, and the count of questions should go up");
}

-(void)testQuestionsAreListedChronologically{
    Question *q1 = [[Question alloc] init];
    q1.date = [NSDate distantPast];
    
    Question *q2 = [[Question alloc] init];
    q2.date = [NSDate distantFuture];
    
    [topic addQuestion:q1];
    [topic addQuestion:q2];
    
    NSArray *questions = [topic recentQuestions];
    Question *listedFirst = [questions objectAtIndex:0];
    Question *listedSecond = [questions objectAtIndex:1];
    
    STAssertEqualObjects([listedFirst.date laterDate:listedSecond.date], listedFirst.date, @"The later question should appear first in the list");
}

-(void)testLimitOfTwentyQuestions{
    Question *q1 = [[Question alloc] init];
    for(NSInteger i =0; i < 25; i++){
        [topic addQuestion:q1];
    }
    STAssertTrue([[topic recentQuestions] count] < 21, @"There should never be more than 20 questions");
}


@end
