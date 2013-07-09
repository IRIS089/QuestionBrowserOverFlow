//
//  StackOverflowCommunicator.h
//  BrowseStackOverflow
//
//  Created by William Cleeton on 6/30/13.
//  Copyright (c) 2013 Ryan Cleeton. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StackOverflowCommunicator : NSObject{
@protected
    NSURL *fetchingURL;
    NSURLConnection *fetchingConnection;
}

-(void)searchForQuestionsWithTag:(NSString *)tag;
-(void)downloadInformationForQuestionWithID:(NSInteger)identifier;
-(void)downloadAnswersToQuestionWithID:(NSInteger)identifier;
-(void)fetchBodyForQuestion:(NSInteger)questionID;
-(void)fetchContentAtURL:(NSURL *)url;
-(void)cancelAndDiscardURLConnection;

@end
