//
//  KHMainViewController.m
//  KHAwesomeImage
//
//  Created by Triệu Khang on 11/10/14.
//  Copyright (c) 2014 Triệu Khang. All rights reserved.
//

#import "KHMainViewController.h"

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

}

@end
