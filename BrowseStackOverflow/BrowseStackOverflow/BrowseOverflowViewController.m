//
//  BrowseOverflowViewController.m
//  BrowseStackOverflow
//
//  Created by William Cleeton on 7/11/13.
//  Copyright (c) 2013 Ryan Cleeton. All rights reserved.
//

#import "BrowseOverflowViewController.h"

@interface BrowseOverflowViewController ()

@end

@implementation BrowseOverflowViewController


@synthesize tableView, dataSource, tableViewDelegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.delegate = self.tableViewDelegate;
    self.tableView.dataSource = self.dataSource;
    self.tableViewDelegate.tableDataSource = dataSource;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
