//
//  ViewController.m
//  ObjectiveImplementations
//
//  Created by Iragam Reddy, Sreekanth Reddy on 5/25/19.
//  Copyright © 2019 Iragam Reddy, Sreekanth Reddy. All rights reserved.
//

#import "FirstViewController.h"
#import "People.h"
#import "Constants.h"
#import "NewTableViewCell.h"
#import "ObjectiveImplementations-Swift.h"
#import "HeaderView.h"
#import "FirstViewModel+FetchData.h"

#define TABLEVIEW_CELL_NAME @"Cell"

@interface FirstViewController () <UITableViewDelegate, UITableViewDataSource>

@property(nonatomic,nonnull,strong) UITableView *tableView;
@property(nonatomic, strong) UIView *headerView;
@property(nonatomic, weak) NSString *name;
@property(nonatomic, strong) NSArray *arrayPeople;
@end

@implementation FirstViewController

-(instancetype)initWithViewModel: (FirstViewModel *)viewModel {
    self = [super init];
    if (!self) { return nil; }
    
    if (viewModel != nil) {
        _viewModel = viewModel;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _arrayPeople = [_viewModel fetchPersonsData];
    
    _tableView = [[UITableView alloc] init];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerClass:NewTableViewCell.class forCellReuseIdentifier:TABLECEll_NAME];
    [self.view pg_addAutoLayoutSubview:_tableView];
    [_tableView pg_autoPinEdgesToSuperviewEdges];
    _headerView = [[HeaderView alloc] initWithFrame: CGRectMake(0.0f, 0.0f, self.view.bounds.size.width, 125.0f)];
    _tableView.tableHeaderView = _headerView;
    [_tableView reloadData];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NewTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TABLECEll_NAME forIndexPath:indexPath];
    People *person = [_arrayPeople objectAtIndex: [indexPath row]];
    [cell initWithData: person.name];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _arrayPeople.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

@end
