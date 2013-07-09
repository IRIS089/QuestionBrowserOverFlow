//
//  InspectableStackOverflowCommunicator.m
//  BrowseStackOverflow
//
//  Created by William Cleeton on 7/3/13.
//  Copyright (c) 2013 Ryan Cleeton. All rights reserved.
//

#import "InspectableStackOverflowCommunicator.h"

@implementation InspectableStackOverflowCommunicator

-(NSURL *)URLToFetch{
    return fetchingURL;
}

-(NSURLConnection *)currentURLConnection{
    return fetchingConnection;
}



@end
