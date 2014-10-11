//
//  KHFreshTodayImagesViewController.m
//  KHAwesomeImage
//
//  Created by Triệu Khang on 11/10/14.
//  Copyright (c) 2014 Triệu Khang. All rights reserved.
//

#import "KHFreshTodayImagesViewController.h"

@interface KHFreshTodayImagesViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) TableController *tableController;
@property (strong, nonatomic) LBDelegateMatrioska *chainDelegate;
@property (strong, nonatomic) NSObject *cellFactory;

@end

@implementation KHFreshTodayImagesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

@end
