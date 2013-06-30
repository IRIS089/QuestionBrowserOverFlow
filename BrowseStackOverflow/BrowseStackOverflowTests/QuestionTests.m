//
//  QuestionTests.m
//  BrowseStackOverflow
//
//  Created by William Cleeton on 6/27/13.
//  Copyright (c) 2013 Ryan Cleeton. All rights reserved.
//

#import "QuestionTests.h"
#import "Question.h"
#import "Answer.h"


@implementation QuestionTests

-(void)setUp {
    question = [[Question alloc] init];
    question.date = [NSDate distantPast];
    question.title = @"Do iPhones dream of electirc sheep?";
    question.score = 42;
    
    Answer *accepted = [[Answer alloc] init];
    accepted.score = 1;
    accepted.accepted = YES;
    [question addAnswer:accepted];
    
    lowScore = [[Answer alloc] init];
    lowScore.score = -4;
    [question addAnswer:lowScore];
    
    highScore = [[Answer alloc] init];
    highScore.score = 4;
    [question addAnswer:highScore];
    
    
}

-(void)tearDown{
    question = nil;
    lowScore = nil;
    highScore = nil;
}

-(void)testQuestionsHasADate {
    NSDate *testDate = [NSDate distantPast];
    question.date = testDate;
    STAssertTrue([question.date isKindOfClass:[NSDate class]], @"Question needs to provide its date");
}

-(void)testQuestionHasAScore{
    STAssertEquals(question.score, 42, @"Questions need a numeric score");
}

-(void)testQuestionHasATitle{
    STAssertEqualObjects(question.title, @"Do iPhones dream of electric sheep?", @"Question should know its title");
}

-(void)testQuestionCanHaveAnswer{
    Answer *myAnswer = [[Answer alloc] init];
    STAssertNoThrow([question addAnswer:myAnswer], @"Must be able to add answers");
}

-(void)testAcceptedAnswerIsFirst{
    STAssertTrue([[question.answers objectAtIndex:0] isAccepted], @"Accepted answer comes first");
}

-(void)testHighScoreAnswerBeforeLow{
    NSArray *answers = question.answers;
    NSInteger highIndex = [answers indexOfObject:highScore];
    NSInteger lowIndex = [answers indexOfObject:lowScore];
    STAssertTrue(highIndex < lowIndex, @"High-scoring answer comes first");
}


@end
