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

    BasicTableViewModel *imageSection = [[BasicTableViewModel alloc] initWithModel:modelLoadMore];
    imageSection.sectionModel = [[DataProvider alloc] initWithPageSize:20];

    self.basicModel = imageSection;

    self.tableController = [[TableController alloc] init];
    [self.tableController setModel:self.basicModel];

    self.tableView.dataSource = self.tableController;

    self.chainDelegate = [[LBDelegateMatrioska alloc] initWithDelegates:@[self.tableController, self]];
    self.tableView.delegate = (id) self.chainDelegate;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if([cell isKindOfClass:[KHLoadMoreTableViewCell class]]) {
        DataProvider *dataProvider = (DataProvider *)self.basicModel.sectionModel;
        [dataProvider loadDataForIndex:0];
    }

}

@end
