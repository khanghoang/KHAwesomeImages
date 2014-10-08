//
//  KHLoadingOperationProtocol.h
//  KHAwesomePicture
//
//  Created by Triệu Khang on 7/10/14.
//  Copyright (c) 2014 Triệu Khang. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol KHLoadingOperationProtocol <NSObject>

- (instancetype)initWithIndexes:(NSIndexSet *)indexes;

- (NSIndexSet *)indexes;
- (NSArray *)dataPage;

@end
