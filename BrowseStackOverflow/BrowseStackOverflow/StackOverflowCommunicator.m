//
//  StackOverflowCommunicator.m
//  BrowseStackOverflow
//
//  Created by William Cleeton on 6/30/13.
//  Copyright (c) 2013 Ryan Cleeton. All rights reserved.
//

#import "StackOverflowCommunicator.h"

@implementation StackOverflowCommunicator

-(void)searchForQuestionsWithTag:(NSString *)tag{
    [self fetchContentAtURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://api.stackoverflow.com/1.1/search?tagged=%@&pagesize=20", tag]]];
}

-(void)fetchContentAtURL:(NSURL *)url{
    fetchingURL = url;
    
    NSURLRequest *request = [NSURLRequest requestWithURL:fetchingURL];
    
    [fetchingConnection cancel];
    fetchingConnection = [NSURLConnection connectionWithRequest:request delegate:self];
}

-(void)cancelAndDiscardURLConnection{
    [fetchingConnection cancel];
    fetchingConnection = nil;
}

@end
