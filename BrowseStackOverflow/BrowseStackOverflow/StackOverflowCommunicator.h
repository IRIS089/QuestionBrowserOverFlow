//
//  StackOverflowCommunicator.h
//  BrowseStackOverflow
//
//  Created by William Cleeton on 6/30/13.
//  Copyright (c) 2013 Ryan Cleeton. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StackOverflowCommunicatorDelegate.h"

@interface StackOverflowCommunicator : NSObject <NSURLConnectionDataDelegate> {
@protected
    NSURL *fetchingURL;
    NSURLConnection *fetchingConnection;
    NSMutableData *receivedData;

@private
    id <StackOverflowCommunicatorDelegate> __weak delegate;
    void (^errorHandler)(NSError *);
    void (^successHandler)(NSString *);
}

@property (weak) id <StackOverflowCommunicatorDelegate> delegate;

-(void)searchForQuestionsWithTag:(NSString *)tag;
-(void)downloadInformationForQuestionWithID:(NSInteger)identifier;
-(void)downloadAnswersToQuestionWithID:(NSInteger)identifier;
-(void)cancelAndDiscardURLConnection;

@end

extern NSString *StackOverflowCommunicatorErrorDomain;