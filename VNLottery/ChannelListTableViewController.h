//
//  ChannelListTableViewController.h
//  VNLottery
//
//  Created by East Agile on 10/4/12.
//  Copyright (c) 2012 East Agile. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChannelListTableViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    NSArray *channelList;
    IBOutlet UIDatePicker *datePicker;
    IBOutlet UITableView *channelTableView;
}

- (IBAction) setTodayPicker:(id)sender;

@end
