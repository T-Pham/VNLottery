//
//  ResultTableViewController.h
//  VNLottery
//
//  Created by East Agile on 10/4/12.
//  Copyright (c) 2012 East Agile. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResultTableViewController : UITableViewController <UITableViewDataSource, UITabBarDelegate>
{
    
}
@property (nonatomic) int channelID;
@property (nonatomic) NSString* channelName;

@end
