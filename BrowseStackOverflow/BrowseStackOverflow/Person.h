//
//  Person.h
//  BrowseStackOverflow
//
//  Created by William Cleeton on 6/28/13.
//  Copyright (c) 2013 Ryan Cleeton. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

-(id)initWithName:(NSString *)aName  avatarLocation:(NSString *)location;

@property (readonly) NSString *name;
@property (readonly) NSURL *avatarURL;

@end
