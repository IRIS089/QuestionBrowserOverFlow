//
//  FakeURLResponse.h
//  BrowseStackOverflow
//
//  Created by William Cleeton on 7/9/13.
//  Copyright (c) 2013 Ryan Cleeton. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FakeURLResponse : NSObject{
    NSInteger statusCode;
}

-(id)initWithStatusCode:(NSInteger)code;
-(NSInteger)statusCode;


@end
