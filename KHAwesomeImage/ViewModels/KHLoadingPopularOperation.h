//
//  KHLoadingPopularOperation.h
//  KHAwesomePicture
//
//  Created by Triệu Khang on 7/10/14.
//  Copyright (c) 2014 Triệu Khang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KHLoadingPopularOperation : NSBlockOperation
<
    KHLoadingOperationProtocol
>

- (instancetype)initWithIndexes:(NSIndexSet *)indexes;
- (void)loadData:(void (^)(NSArray *data))finishBlock;

@property (nonatomic, readonly) NSIndexSet *indexes;
@property (nonatomic, readonly) NSArray *dataPage;

@end
