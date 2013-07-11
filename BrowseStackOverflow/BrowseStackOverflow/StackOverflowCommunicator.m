//
//  StackOverflowCommunicator.m
//  BrowseStackOverflow
//
//  Created by William Cleeton on 6/30/13.
//  Copyright (c) 2013 Ryan Cleeton. All rights reserved.
//

#import "StackOverflowCommunicator.h"

@interface StackOverflowCommunicator ()

- (void)fetchContentAtURL: (NSURL *)url errorHandler: (void(^)(NSError *error))errorBlock successHandler: (void(^)(NSString *objectNotation)) successBlock;
- (void)launchConnectionForRequest: (NSURLRequest *)request;

@end

@implementation StackOverflowCommunicator

@synthesize delegate;

-(void)searchForQuestionsWithTag:(NSString *)tag{
    [self fetchContentAtURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://api.stackoverflow.com/1.1/search?tagged=%@&pagesize=20", tag]] errorHandler:^(NSError *error){[delegate searchingForQuestionsFailedWithError:error];} successHandler:^(NSString *objectNotation){[delegate receivedQuestionsJSON:objectNotation];}];
    
}

-(void)cancelAndDiscardURLConnection{
    [fetchingConnection cancel];
    fetchingConnection = nil;
}

-(void)launchConnectionForRequest:(NSURLRequest *)request{
    [self cancelAndDiscardURLConnection];
    fetchingConnection = [NSURLConnection connectionWithRequest:request delegate:self];
}

-(void)fetchContentAtURL:(NSURL *)url errorHandler:(void (^)(NSError *))errorBlock successHandler:(void (^)(NSString *))successBlock{
    fetchingURL = url;
    errorHandler = [errorBlock copy];
    successHandler = [successBlock copy];
    NSURLRequest *request = [NSURLRequest requestWithURL:fetchingURL];
    
    [self launchConnectionForRequest:request];
}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    receivedData = nil;
    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
    if ([httpResponse statusCode] != 200) {
        NSError *error = [NSError errorWithDomain:StackOverflowCommunicatorErrorDomain code:[httpResponse statusCode] userInfo:nil];
        errorHandler(error);
        [self cancelAndDiscardURLConnection];
    }else{
        receivedData = [[NSMutableData alloc] init];
    }
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    receivedData = nil;
    fetchingConnection = nil;
    fetchingURL = nil;
    errorHandler(error);
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
    fetchingConnection = nil;
    fetchingURL = nil;
    NSString *receivedText = [[NSString alloc] initWithData:receivedData encoding:NSUTF8StringEncoding];
    receivedData = nil;
    successHandler(receivedText);
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [receivedData appendData:data];
}

-(void)dealloc{
    [fetchingConnection cancel];
}

@end

NSString *StackOverflowCommunicatorErrorDomain = @"StackOverflowCommunicatorErrorDomain";
