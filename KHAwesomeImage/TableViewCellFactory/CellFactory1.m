//
//  CellFactory1.m
//  KHCleanTableViewController
//
//  Created by Triệu Khang on 3/10/14.
//  Copyright (c) 2014 Triệu Khang. All rights reserved.
//

#import "CellFactory1.h"
#import "KHImageTableViewCell.h"
#import "KHLoadMoreSection.h"
#import "KHLoadMoreTableViewCell.h"

@implementation CellFactory1

+ (CGFloat)heightForItemAtIndexpath:(NSIndexPath *)indexpaht model:(id <KHTableViewModel> )model {
	if ([[model sectionAtIndex:indexpaht.section] isKindOfClass:[KHLoadMoreSection class]]) {
		return 40;
	}
	return 320;
}

+ (UITableViewCell <KHCellProtocol> *)cellAtIndexPath:(NSIndexPath *)indexPath tableView:(UITableView *)tableView model:(id <KHTableViewModel> )model {
	if ([[model sectionAtIndex:indexPath.section] isKindOfClass:[KHLoadMoreSection class]]) {
		return [self _getReusableCellWithClass:[KHLoadMoreTableViewCell class] tableView:tableView];
	}

	id data = [model itemAtIndexpath:indexPath];

	UITableViewCell <KHCellProtocol> *cell = [self _getReusableCellWithClass:[KHImageTableViewCell class] tableView:tableView];
	[cell configWithData:data];
	return cell;
}

#pragma mark - Private methods

+ (UITableViewCell <KHCellProtocol> *)_getReusableCellWithClass:(Class)cellClass tableView:(UITableView *)tableView {
	[self _registerTheClass:cellClass toTableView:tableView];
	return [self _dequeueReuseableCellWithClass:cellClass ofTableView:tableView];
}

+ (void)_registerTheClass:(Class)cellClass toTableView:(UITableView *)tableView {
	UINib *cellNib = [UINib nibWithNibName:NSStringFromClass(cellClass) bundle:nil];
	[tableView registerNib:cellNib forCellReuseIdentifier:NSStringFromClass(cellClass)];
}

+ (UITableViewCell <KHCellProtocol> *)_dequeueReuseableCellWithClass:(Class)cellClass ofTableView:(UITableView *)tableView {
	UITableViewCell <KHCellProtocol> *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(cellClass)];
	return cell;
}

@end
