//
//  MockStackOverflowManagerDelegate.h
//  BrowseStackOverflow
//
//  Created by William Cleeton on 6/30/13.
//  Copyright (c) 2013 Ryan Cleeton. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Topic.h"
#import "StackOverflowManagerDelegate.h"

@interface MockStackOverflowManagerDelegate : NSObject <StackOverflowManagerDelegate>

@property (strong) NSError *fetchError;
@property (strong) NSArray *receivedQuestions;

@end
