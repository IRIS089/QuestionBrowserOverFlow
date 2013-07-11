//
//  NonNetworkedStackOverflowCommunicator.m
//  BrowseStackOverflow
//
//  Created by William Cleeton on 7/9/13.
//  Copyright (c) 2013 Ryan Cleeton. All rights reserved.
//

#import "NonNetworkedStackOverflowCommunicator.h"

@implementation NonNetworkedStackOverflowCommunicator

-(void)launchConnectionForRequest:(NSURLRequest *)request{
    
}

-(void)setReceivedData:(NSData *)data{
    receivedData = [data mutableCopy];
}

-(NSData *)receivedData{
    return [receivedData copy];
}
@end
