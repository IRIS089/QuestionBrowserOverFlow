//
//  MockStackOverflowManager.h
//  BrowseStackOverflow
//
//  Created by William Cleeton on 7/9/13.
//  Copyright (c) 2013 Ryan Cleeton. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StackOverflowCommunicatorDelegate.h"

@interface MockStackOverflowManager : NSObject <StackOverflowCommunicatorDelegate>{
    NSInteger topicFailureErrorCode;
    NSString *topicSearchString;
}

-(NSInteger)topicFailureErrorCode;
-(NSString *)topicSearchString;

@end
