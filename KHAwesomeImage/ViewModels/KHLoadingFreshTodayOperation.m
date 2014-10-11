//
//  KHLoadingFreshTodayOperation.m
//  KHAwesomeImage
//
//  Created by Triệu Khang on 11/10/14.
//  Copyright (c) 2014 Triệu Khang. All rights reserved.
//

#import "KHLoadingFreshTodayOperation.h"

@interface KHLoadingFreshTodayOperation()

@property (strong, nonatomic) NSIndexSet *indexes;
@property (strong, nonatomic) NSArray *dataPage;

@end

@implementation KHLoadingFreshTodayOperation

- (instancetype)initWithIndexes:(NSIndexSet *)indexes {
	self = [super init];

	if (self) {
		_indexes = indexes;
	}

	return self;
}

- (void)loadData:(void (^)(NSArray *))finishBlock {
	typeof(self) weakSelf = self;
	[self addExecutionBlock: ^{
	    NSMutableArray *dataPage = [NSMutableArray arrayWithCapacity:20];
	    [PXRequest authenticateWithUserName:@"hoangtrieukhang" password:@"123#@!MinhKhang" completion: ^(BOOL success) {
	        if (success) {
	            [PXRequest requestForPhotoFeature:PXAPIHelperPhotoFeatureFreshWeek resultsPerPage:20 page:(weakSelf.indexes.lastIndex + 1) / 20 completion: ^(NSDictionary *results, NSError *error) {
	                [weakSelf.indexes enumerateIndexesUsingBlock: ^(NSUInteger idx, BOOL *stop) {
	                    id data = [results[@"photos"] objectAtIndex:idx % 20];
	                    dataPage[idx % 20] = data;
					}];
	                weakSelf.dataPage = dataPage;
	                if (finishBlock) {
	                    finishBlock(dataPage);
					}
				}];
			}
	        else {
			}
		}];
	}];
}

@end
