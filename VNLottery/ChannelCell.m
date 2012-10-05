//
//  ChannelCell.m
//  VNLottery
//
//  Created by East Agile on 10/5/12.
//  Copyright (c) 2012 East Agile. All rights reserved.
//

#import "ChannelCell.h"

@implementation ChannelCell
@synthesize activityIndicator;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
