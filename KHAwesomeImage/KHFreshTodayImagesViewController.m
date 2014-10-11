//
//  KHFreshTodayImagesViewController.m
//  KHAwesomeImage
//
//  Created by Triệu Khang on 11/10/14.
//  Copyright (c) 2014 Triệu Khang. All rights reserved.
//

#import "KHFreshTodayImagesViewController.h"
#import "KHContentLoadingFreshTodayViewModel.h"
#import "KHLoadingFreshTodayOperation.h"
#import "KHFreshTodayCellFactory.h"

@interface KHFreshTodayImagesViewController ()
<
    DataProviderDelegate,
    HandleContentLoadingProtocol
>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) TableController *tableController;
@property (strong, nonatomic) BasicTableViewModel *basicModel;
@property (strong, nonatomic) LBDelegateMatrioska *chainDelegate;
@property (strong, nonatomic) id<KHTableViewCellFactoryProtocol> cellFactory;

@end

@implementation KHFreshTodayImagesViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view.
	self.tableController = [[TableController alloc] init];

	self.tableView.dataSource = self.tableController;
	self.tableController.factory = [[KHFreshTodayCellFactory alloc] init];

	self.chainDelegate = [[LBDelegateMatrioska alloc] initWithDelegates:@[self.tableController, self]];
	self.tableView.delegate = (id)self.chainDelegate;

	BasicTableViewModel *loadingContentSection = [[BasicTableViewModel alloc] init];
	KHContentLoadingFreshTodayViewModel *loadingContentViewModel = [[KHContentLoadingFreshTodayViewModel alloc] init];
	loadingContentSection.sectionModel = loadingContentViewModel;
	loadingContentViewModel.delegate = (id)self;

	self.basicModel = loadingContentSection;
	self.tableController.model = self.basicModel;

	[self.tableView reloadData];

	[loadingContentViewModel loadContent];
}

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

- (void)didLoadWithResultWithTotalPage:(NSInteger)totalItems error:(NSError *)error operation:(AFHTTPRequestOperation *)operation {
	DataProvider *dataProvider = [[DataProvider alloc] init];
	dataProvider.delegate = (id)self;
	dataProvider.shouldLoadAutomatically = YES;
	dataProvider.automaticPreloadMargin = 20;

	BasicTableViewModel *imageSection = [[BasicTableViewModel alloc] init];
	imageSection.sectionModel = dataProvider;

	self.basicModel = imageSection;

	[self.tableController setModel:self.basicModel];

	[dataProvider loadDataForIndex:0];
	[self.tableView reloadData];
}

- (id <KHLoadingOperationProtocol> )loadingOperationForSectionViewModel:(id <KHTableViewSectionModel> )viewModel indexes:(NSIndexSet *)indexes {
    return [[KHLoadingFreshTodayOperation alloc] initWithIndexes:indexes];
}

@end
