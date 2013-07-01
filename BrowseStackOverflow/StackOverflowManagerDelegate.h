//
//  StackOverflowManagerDelegate.h
//  BrowseStackOverflow
//
//  Created by William Cleeton on 6/30/13.
//  Copyright (c) 2013 Ryan Cleeton. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Topic.h"


@protocol StackOverflowManagerDelegate <NSObject>

-(void)fetchingQuestionsFailedWithError:(NSError *)error;
-(void)fetchingQuestionsOnTopic:(Topic *)topic failedWithError:(NSError *)error;

@end
