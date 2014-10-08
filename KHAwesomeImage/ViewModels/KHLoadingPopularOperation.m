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
		    NSMutableArray *dataPage = [NSMutableArray array];
		    [PXRequest authenticateWithUserName:@"hoangtrieukhang" password:@"123#@!MinhKhang" completion: ^(BOOL success) {
		        if (success) {
                    [PXRequest requestForPhotoFeature:PXAPIHelperPhotoFeaturePopular resultsPerPage:20 page:indexes.lastIndex completion: ^(NSDictionary *results, NSError *error) {
                        [dataPage addObjectsFromArray:results[@"photos"]];
					}];
				}
		        else {

				}
			}];
		    weakSelf->_dataPage = dataPage;
		}];
	}

	return self;
}

@end
