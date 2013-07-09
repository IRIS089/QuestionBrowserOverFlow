//
//  QuestionBuilderTests.m
//  BrowseStackOverflow
//
//  Created by William Cleeton on 7/1/13.
//  Copyright (c) 2013 Ryan Cleeton. All rights reserved.
//

#import "QuestionBuilderTests.h"
#import "QuestionBuilder.h"
#import "Question.h"
#import "Person.h"  

@implementation QuestionBuilderTests{
@private
    QuestionBuilder *questionBuilder;
    Question *question;
}

static NSString *questionJSON = @"{"
@"\"total\": 1,"
@"\"page\": 1,"
@"\"pagesize\": 30,"
@"\"questions\": ["
@"{"
@"\"tags\": ["
@"\"iphone\","
@"\"security\","
@"\"keychain\""
@"],"
@"\"answer_count\": 1,"
@"\"accepted_answer_id\": 3231900,"
@"\"favorite_count\": 1,"
@"\"question_timeline_url\": \"/question/2817980/timeline\","
@"\"question_comments_url\": \"/questions/2817980/comments\","
@"\"question_answers_url\": \"/questions/2817980/answers\","
@"\"question_id\": 2817980,"
@"\"owner\"; {"
@"\"user_id\": 23743,"
@"\"user_type\": \"registered\","
@"\"display_name\": \"Graham Lee\","
@"\"reputation\": 13459,"
@"\"email_hash\": \"563290c0c1b776a315b36e863b388a0c\""
@"},"
@"\"creation_date\": 1273660706,"
@"\"last_activity_date\": 1278965736,"
@"\"up_vote_count\": 2,"
@"\"down_vote_count\": 0,"
@"\"view_count\":465,"
@"\"score\": 2,"
@"\"community_owned\": false,"
@"\"title\": \"Why does Keychain Services return the wrong keychain content?\","
@"\"body\": \"<p>I've been typing to use persistent keychain references.</p>\""
@"}"
@"]"
@"}";

-(void)setUp{
    questionBuilder = [[QuestionBuilder alloc] init];
    question = [[questionBuilder questionsFromJSON:questionJSON error:NULL] objectAtIndex:0];
}

-(void)tearDown{
    questionBuilder = nil;
    question = nil;
}

-(void)testThatNilIsNotAnAcceptableParameter{
    STAssertThrows([questionBuilder questionsFromJSON:nil error:NULL], @"Lack of data should have been handled elsewhere(StackOverflowManager)");
}

-(void)testNilIsReturnedWhenStringIsNotJSON{
    STAssertNil([questionBuilder questionsFromJSON:@"Not JSON" error:NULL], @"This parameter should not be parsable");
}

-(void)testErrorSetWhenStringIsNotJSON{
    NSError *error = nil;
    [questionBuilder questionsFromJSON:@"Not JSON" error:&error];
    STAssertNotNil(error, @"An error occurred, we should be told");
}

-(void)testPassingNullErrorDoesNotCauseCrash{
    STAssertNoThrow([questionBuilder questionsFromJSON:@"Not JSON" error:NULL], @"Using a NULL error parameter should not be a problem");
}

-(void)testRealJSONWithoutQuestionsArrayError{
    NSString *jsonString = @"{ \"noquestions\": true}";
    STAssertNil([questionBuilder questionsFromJSON:jsonString error:NULL], @"No questions to parse in this JSON");
}

-(void)testRealJSONWithoutQuestionsReturnsMissingDataError{
    NSString *jsonString = @"{ \"noquestions\": true}";
    NSError *error = nil;
    [questionBuilder questionsFromJSON:jsonString error:&error];
    STAssertEquals([error code], QuestionBuilderMissingDataError, @"This case should not be an invalid JSON error");
}

-(void)testJSONWithOneQuestionReturnsOneQuestionObject{
    NSError *error = nil;
    NSArray *questions = [questionBuilder questionsFromJSON:questionJSON error:&error];
    STAssertEquals([questions count], (NSUInteger)1, @"The builder should have created a question");
}

-(void)testQuestionCreatedFromJSONHasPropertiesPresentedInJSON{
    STAssertEquals(question.questionID, 2817980, @"The question ID should match the one we sent");
    STAssertEquals([question.date timeIntervalSince1970], (NSTimeInterval)1273660706, @"The date of the question should match the data");
    STAssertEqualObjects(question.title, @"Why does Keychain Services return the wrong keychain content?", @"Title should match the provided data");
    STAssertEquals(question.score, 2, @"Score should match the data");
    Person *asker = question.asker;
    STAssertEqualObjects(asker.name, @"Graham Lee", @"Looks like I should have asked this question");
    STAssertEqualObjects([asker.avatarURL absoluteString], @"http://www.gravatar.com/avatar/563290c0c1b776a315b36e863b388a0c", @"The avatar URL should be based on the supplied email hash");
}

-(void)testQuestionCreatedFromEmptyObjectIsStillValidObject{
    NSString *emptyQuestion = @"{ \"questions\": [ {} ] }";
    NSArray *questions = [questionBuilder questionsFromJSON:emptyQuestion error:NULL];
    STAssertEquals([questions count], (NSUInteger)1, @"QuestionBuilder must handle partial input");
}

-(void)testBuildingQuestionBodyWithNoDataCannotBeTired{
    STAssertThrows([questionBuilder fillInDetailsForQuestion:question fromJSON:nil], @"Not receiving data should have been handled earlier");
}

-(void)testNonJSONDataDoesNotCauseABodyToBeAddedToAQuestion{
    NSString *stringIsNotJSON = nil;
    [questionBuilder fillInDetailsForQuestion:nil fromJSON:stringIsNotJSON];
    STAssertNil(question.body, @"Body should not have been added");
}

-(void)testJSONWhichDoesNotContainABodyDoesNotCauseBodyToBeAdded{
    NSString *noQuestionsJSONString = nil;
    [questionBuilder fillInDetailsForQuestion:question fromJSON:noQuestionsJSONString];
    STAssertNil(question.body, @"There was no body to add");
}

-(void)testBodyContainedInJSONIsAddedToQuestion{
    [questionBuilder fillInDetailsForQuestion:question fromJSON:questionJSON];
    STAssertEqualObjects(question.body, @"<p>I've been typing to use persistent keychain references.</p>", @"The correct question body is added");
}



@end
