//
//  Answer.h
//  BrowseStackOverflow
//
//  Created by William Cleeton on 6/29/13.
//  Copyright (c) 2013 Ryan Cleeton. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

@interface Answer : NSObject

@property (readwrite) NSString *text;
@property (readwrite) NSInteger score;
@property (nonatomic, strong) Person *person;
@property (getter = isAccepted) BOOL accepted;

-(NSComparisonResult)compare:(Answer *)otherAnswer;

@end
