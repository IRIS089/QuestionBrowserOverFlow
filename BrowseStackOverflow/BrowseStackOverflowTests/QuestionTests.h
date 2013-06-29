//
//  QuestionTests.h
//  BrowseStackOverflow
//
//  Created by William Cleeton on 6/27/13.
//  Copyright (c) 2013 Ryan Cleeton. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import <UIKit/UIKit.h>

@class Question;
@class Answer;

@interface QuestionTests : SenTestCase {
    Question *question;
    Answer *lowScore;
    Answer *highScore;
}

@end
