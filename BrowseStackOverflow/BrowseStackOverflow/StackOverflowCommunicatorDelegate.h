//
//  StackOverflowCommunicatorDelegate.h
//  BrowseStackOverflow
//
//  Created by William Cleeton on 7/9/13.
//  Copyright (c) 2013 Ryan Cleeton. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol StackOverflowCommunicatorDelegate <NSObject>

-(void)receivedQuestionsJSON:(NSString *)objectNotation;
-(void)searchingForQuestionsFailedWithError:(NSError *)error;
@end
