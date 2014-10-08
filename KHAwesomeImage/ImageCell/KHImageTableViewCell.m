//
//  KHImageTableViewCell.m
//  KHAwesomePicture
//
//  Created by Triệu Khang on 7/10/14.
//  Copyright (c) 2014 Triệu Khang. All rights reserved.
//

#import "KHImageTableViewCell.h"

@interface KHImageTableViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@end

@implementation KHImageTableViewCell

- (void)awakeFromNib {
    // Initialization code
    [self.imgView setImage:nil];
}

- (void)configWithData:(id)data {

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
