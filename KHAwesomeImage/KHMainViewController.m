//
//  KHMainViewController.m
//  KHAwesomeImage
//
//  Created by Triệu Khang on 11/10/14.
//  Copyright (c) 2014 Triệu Khang. All rights reserved.
//

#import "KHMainViewController.h"
#import "ViewController.h"

typedef NS_ENUM(NSUInteger, kMainViewControllerSegmentValue) {
    kMainViewControllerSegmentValuePopular = 0,
    kMainViewControllerSegmentValueFreshToday = 1
};

@interface KHMainViewController ()

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentType;

@end

@implementation KHMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self onSegment:self.segmentType];
}

- (IBAction)onSegment:(UISegmentedControl *)segment {
    [self changeChildViewControllerWithType:segment.selectedSegmentIndex];
}

- (void)changeChildViewControllerWithType:(kMainViewControllerSegmentValue)type {
    ViewController *vc = [[UIStoryboard storyboardWithName:@"Popular" bundle:nil] instantiateViewControllerWithIdentifier:NSStringFromClass([ViewController class])];
    [vc willMoveToParentViewController:self];
    [self.view addSubview:vc.view];
    [self addChildViewController:vc];
    [vc didMoveToParentViewController:self];
}

@end
