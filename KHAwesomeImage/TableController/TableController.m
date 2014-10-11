//
//  TableController.m
//  KHCleanTableViewController
//
//  Created by Triệu Khang on 2/10/14.
//  Copyright (c) 2014 Triệu Khang. All rights reserved.
//

#import "TableController.h"
#import "BasicTableViewModel.h"
#import "KHBasicSectionModel.h"
#import "CellFactory1.h"

@interface TableController()

@end

@implementation TableController

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    NSUInteger sections = [self.model numberOfSection];
    return sections;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSUInteger numberCellInSection = [self.model numberOfItemsInSection:section];
    return numberCellInSection;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self.factory heightForItemAtIndexpath:indexPath model:self.model];
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self.factory heightForItemAtIndexpath:indexPath model:self.model];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self.factory cellAtIndexPath:indexPath tableView:tableView model:self.model];
}

@end
