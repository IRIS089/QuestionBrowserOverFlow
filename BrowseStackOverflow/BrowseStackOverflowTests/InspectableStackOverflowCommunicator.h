//
//  InspectableStackOverflowCommunicator.h
//  BrowseStackOverflow
//
//  Created by William Cleeton on 7/3/13.
//  Copyright (c) 2013 Ryan Cleeton. All rights reserved.
//

#import "StackOverflowCommunicator.h"

@interface InspectableStackOverflowCommunicator : StackOverflowCommunicator

-(NSURL *)URLToFetch;
-(NSURLConnection *)currentURLConnection;

@end
