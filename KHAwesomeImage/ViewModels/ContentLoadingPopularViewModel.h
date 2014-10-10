//
//  ContentLoadingPopularViewModel.h
//  KHAwesomeImage
//
//  Created by Triệu Khang on 10/10/14.
//  Copyright (c) 2014 Triệu Khang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HandleContentLoadingProtocol.h"
#import "ContentLoadingProtocol.h"

@interface ContentLoadingPopularViewModel : NSObject
<
ContentLoadingProtocol,
KHTableViewSectionModel
>

@property (nonatomic, weak) id<HandleContentLoadingProtocol> delegate;

@end
