//
//  PersonTests.m
//  BrowseStackOverflow
//
//  Created by William Cleeton on 6/28/13.
//  Copyright (c) 2013 Ryan Cleeton. All rights reserved.
//

#import "PersonTests.h"
#import "Person.h"

@implementation PersonTests

-(void)setUp{
    person = [[Person alloc] initWithName:@"Graham Lee" avatarLocation:@"http:example.com/avatar.png"];
}

-(void)tearDown{
    person = nil;
}

-(void)testThatPersonHasAName{
    STAssertEqualObjects(person.name, @"Graham Lee", @"expecting person to provide its name");
}

-(void)testThatPersonHasAvatarURL{
    NSURL *url = person.avatarURL;
    STAssertEqualObjects([url absoluteString], @"http:example.com/avatar.png", @"The Person's avatar should be represented by a URL");
}

@end
