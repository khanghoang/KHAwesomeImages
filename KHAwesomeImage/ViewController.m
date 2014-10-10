//
//  ViewController.m
//  KHAwesomePicture
//
//  Created by Triệu Khang on 7/10/14.
//  Copyright (c) 2014 Triệu Khang. All rights reserved.
//

#import "ViewController.h"
#import "CellFactory1.h"
#import "DataProvider.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) TableController *tableController;
@property (strong, nonatomic) BasicTableViewModel *basicModel;

@property (strong, nonatomic) LBDelegateMatrioska *chainDelegate;

@property (strong, nonatomic) CellFactory1 *cellFactory;

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

	BasicTableViewModel *modelLoadMore = [[BasicTableViewModel alloc] init];
	modelLoadMore.sectionModel = [[KHLoadMoreSection alloc] init];

	DataProvider *dataProvider = [[DataProvider alloc] initWithPageSize:20];
	[dataProvider loadDataForIndex:0];
	dataProvider.delegate = (id)self;
    dataProvider.shouldLoadAutomatically = YES;
    dataProvider.automaticPreloadMargin = 20;

	BasicTableViewModel *imageSection = [[BasicTableViewModel alloc] initWithModel:modelLoadMore];
	imageSection.sectionModel = dataProvider;

	self.basicModel = imageSection;

	self.tableController = [[TableController alloc] init];
	[self.tableController setModel:self.basicModel];

	self.tableView.dataSource = self.tableController;

	self.chainDelegate = [[LBDelegateMatrioska alloc] initWithDelegates:@[self.tableController, self]];
	self.tableView.delegate = (id)self.chainDelegate;

	if ([self isViewLoaded]) {
		[self.tableView reloadData];
	}
}

//- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
//	DataProvider *dataProvider = (DataProvider *)self.basicModel.sectionModel;
//	if (indexPath.row % 20 == 0) {
//        [dataProvider loadDataForIndex:indexPath.row];
//	}
//}

#pragma mark - Data controller delegate

- (void)dataProvider:(DataProvider *)dataProvider didLoadDataAtIndexes:(NSIndexSet *)indexes {
	[self.tableView beginUpdates];
	[indexes enumerateIndexesUsingBlock: ^(NSUInteger idx, BOOL *stop) {
	    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:idx inSection:0];
	    BOOL visible = [[self.tableView indexPathsForVisibleRows] containsObject:indexPath];
	    if (visible) {
	        [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
		}
	}];
	[self.tableView endUpdates];
}

@end
