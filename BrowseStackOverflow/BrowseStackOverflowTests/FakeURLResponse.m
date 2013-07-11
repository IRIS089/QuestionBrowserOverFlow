//
//  FakeURLResponse.m
//  BrowseStackOverflow
//
//  Created by William Cleeton on 7/9/13.
//  Copyright (c) 2013 Ryan Cleeton. All rights reserved.
//

#import "FakeURLResponse.h"

@implementation FakeURLResponse

-(id)initWithStatusCode:(NSInteger)code{
    if((self = [super init])){
        statusCode = code;
    }
    return self;
}

-(NSInteger)statusCode{
    return statusCode;
}

@end
