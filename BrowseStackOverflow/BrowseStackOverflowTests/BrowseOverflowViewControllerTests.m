//
//  BrowseOverflowViewControllerTests.m
//  BrowseStackOverflow
//
//  Created by William Cleeton on 7/11/13.
//  Copyright (c) 2013 Ryan Cleeton. All rights reserved.
//

#import "BrowseOverflowViewControllerTests.h"
#import "BrowseOverflowViewController.h"
#import "TopicTableDataSource.h"
#import "TopicTableDelegate.h"

@implementation BrowseOverflowViewControllerTests{
    BrowseOverflowViewController *viewController;
    UITableView *tableView;
    id <UITableViewDataSource> dataSource;
    TopicTableDelegate *delegate;
}

-(void)setUp{
    viewController = [[BrowseOverflowViewController alloc] init];
    tableView = [[UITableView alloc] init];
    viewController.tableView = tableView;
    dataSource = [[TopicTableDataSource alloc] init];
    delegate = [[TopicTableDelegate alloc] init];
    viewController.dataSource = dataSource;
    viewController.tableViewDelegate = delegate;
}

-(void)tearDown{
    viewController = nil;
    tableView = nil;
    dataSource = nil;
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

-(void)testViewControllerConnectsDataSourceInViewDidLoad{
    [viewController viewDidLoad];
    STAssertEqualObjects([tableView dataSource], dataSource, @"View controller should have set the table view's data source");
}

-(void)testViewControllerConnectsDelegateInViewDidLoad{
    [viewController viewDidLoad];
    STAssertEqualObjects([tableView delegate], delegate, @"View controller should have set the table view's delegate");
}

-(void)testViewControllerConnectsDataSourceToDelegate{
    [viewController viewDidLoad];
    STAssertEqualObjects(delegate.tableDataSource, dataSource, @"The view controller should tell the table view delegate about its data source");
}

@end
