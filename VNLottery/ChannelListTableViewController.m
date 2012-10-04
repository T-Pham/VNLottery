//
//  ChannelListTableViewController.m
//  VNLottery
//
//  Created by East Agile on 10/4/12.
//  Copyright (c) 2012 East Agile. All rights reserved.
//

#import "ChannelListTableViewController.h"
#import "ResultTableViewController.h"

@interface ChannelListTableViewController ()

@end

@implementation ChannelListTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    channelList = [[NSArray alloc]
                   initWithObjects:
                   @"Miền Bắc",
                   @"An Giang",
                   @"Bình Dương",
                   @"Bình Phước",
                   @"Bình Thuận",
                   @"Bạc Liêu",
                   @"Bến Tre",
                   @"Cà Mau",
                   @"Cần Thơ",
                   @"Hậu Giang",
                   @"Hồ Chí Minh",
                   @"Kiên Giang",
                   @"Long An",
                   @"Sóc Trăng",
                   @"Tiền Giang",
                   @"Trà Vinh",
                   @"Tây Ninh",
                   @"Vĩnh Long",
                   @"Vũng Tàu",
                   @"Đà Lạt",
                   @"Đồng Nai",
                   @"Đồng Tháp",
                   nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [channelList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Result Cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Result Cell"];
    }
    [[cell textLabel] setText:[channelList objectAtIndex:[indexPath row]]];
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
    UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"VNLottery" bundle:nil];
    ResultTableViewController *resultTableViewController = (ResultTableViewController *)[mainStoryBoard instantiateViewControllerWithIdentifier:@"Result View"];
    [resultTableViewController setChannelID:[indexPath row]];
    [resultTableViewController setChannelName:[channelList objectAtIndex:[indexPath row]]];
    [self.navigationController pushViewController:resultTableViewController animated:YES];
}

@end
