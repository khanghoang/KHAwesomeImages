//
//  TableController.h
//  KHCleanTableViewController
//
//  Created by Triệu Khang on 2/10/14.
//  Copyright (c) 2014 Triệu Khang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "KHTableViewModel.h"

@interface TableController : NSObject
<
UITableViewDataSource,
UITableViewDelegate
>

@property (strong, nonatomic) id<KHTableViewModel> model;

@end
