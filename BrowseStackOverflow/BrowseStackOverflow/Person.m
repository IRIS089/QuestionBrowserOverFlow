//
//  Person.m
//  BrowseStackOverflow
//
//  Created by William Cleeton on 6/28/13.
//  Copyright (c) 2013 Ryan Cleeton. All rights reserved.
//

#import "Person.h"

@implementation Person

-(id)initWithName:(NSString *)aName avatarLocation:(NSString *)location{
    if((self = [super init])){
        _name = [aName copy];
        _avatarURL = [[NSURL alloc] initWithString:location];
    }
    return self;
}

@end
