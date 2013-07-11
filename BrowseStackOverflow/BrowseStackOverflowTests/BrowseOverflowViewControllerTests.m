//
//  BrowseOverflowViewControllerTests.m
//  BrowseStackOverflow
//
//  Created by William Cleeton on 7/11/13.
//  Copyright (c) 2013 Ryan Cleeton. All rights reserved.
//

#import "BrowseOverflowViewControllerTests.h"
#import "BrowseOverflowViewController.h"

@implementation BrowseOverflowViewControllerTests{
    BrowseOverflowViewController *viewController;
}

-(void)setUp{
    viewController = [[BrowseOverflowViewController alloc] init];
}

-(void)tearDown{
    viewController = nil;
}

-(void)testViewControllerHasATableViewProperty{
    objc_property_t tableViewProperty = class_getProperty([viewController class], "tableView");
    STAssertTrue(tableViewProperty != NULL, @"BrowseOverflowViewController needs a table view");
}

-(void)testViewControllerHasADataSourceProperty{
    objc_property_t delegateSourceProperty = class_getProperty([viewController class], "tableViewDelegate");
    STAssertTrue(dataSourceProperty != NULL, @"View controller needs a data source");
}

-(void)testViewControllerHasATableViewDelegateProperty{
    objc_property_t delegateProperty = class_getProperty([viewController class], "tableViewDelegate");
    STAssertTrue(delegateProperty != NULL, @"View Controller needs a table view delegate");
}
@end
