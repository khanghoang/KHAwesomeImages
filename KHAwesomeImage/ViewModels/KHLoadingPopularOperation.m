//
//  KHLoadingPopularOperation.m
//  KHAwesomePicture
//
//  Created by Triệu Khang on 7/10/14.
//  Copyright (c) 2014 Triệu Khang. All rights reserved.
//

#import "KHLoadingPopularOperation.h"

@interface KHLoadingPopularOperation ()

@property (nonatomic, readonly) NSIndexSet *indexes;
@property (nonatomic, readonly) NSArray *dataPage;

@end

@implementation KHLoadingPopularOperation

- (instancetype)initWithIndexes:(NSIndexSet *)indexes {
	self = [super init];

	if (self) {
		_indexes = indexes;

		typeof(self) weakSelf = self;
		[self addExecutionBlock: ^{
		    // Generate data
		    NSMutableArray *dataPage = [NSMutableArray arrayWithCapacity:20];
            [indexes enumerateIndexesUsingBlock:^(NSUInteger idx, BOOL *stop) {
                [dataPage addObject:@(idx+1)];
            }];
		    weakSelf->_dataPage = dataPage;
		    dispatch_sync(dispatch_get_main_queue(), ^{
		        [PXRequest authenticateWithUserName:@"hoangtrieukhang" password:@"123#@!MinhKhang" completion: ^(BOOL success) {
		            if (success) {
		                [PXRequest requestForPhotoFeature:PXAPIHelperPhotoFeaturePopular resultsPerPage:20 page:indexes.lastIndex / 20 completion: ^(NSDictionary *results, NSError *error) {
		                    [indexes enumerateIndexesUsingBlock: ^(NSUInteger idx, BOOL *stop) {
		                        dataPage[idx] = [results[@"photos"] objectAtIndex:idx];
							}];
						}];
					}
		            else {
					}
				}];
			});
		}];
	}

	return self;
}

@end
