//
//  MockStackOverflowManagerDelegate.m
//  BrowseStackOverflow
//
//  Created by William Cleeton on 6/30/13.
//  Copyright (c) 2013 Ryan Cleeton. All rights reserved.
//

#import "MockStackOverflowManagerDelegate.h"

@implementation MockStackOverflowManagerDelegate

-(void)fetchingQuesitonsFailedWithError:(NSError *)error{
    self.fetchError = error;
}

@end
