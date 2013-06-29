//
//  Topic.h
//  BrowseStackOverflow
//
//  Created by William Cleeton on 6/27/13.
//  Copyright (c) 2013 Ryan Cleeton. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Question.h"

@interface Topic : NSObject

@property (readonly) NSString *name;
@property (readonly) NSString *tag;

-(NSArray *)recentQuestions;


-(id)initWithName:(NSString *)newName tag:(NSString *)tag;
-(void)addQuestion:(Question *)question;


@end
