//
//  ResultTableViewController.m
//  VNLottery
//
//  Created by East Agile on 10/4/12.
//  Copyright (c) 2012 East Agile. All rights reserved.
//

#import "ResultTableViewController.h"

@interface ResultTableViewController ()

@end

@implementation ResultTableViewController
@synthesize channelID;
@synthesize channelName;

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
    NSString *url = [self urlStringWithID:channelID infoID:-1];
    NSString *result = [self contentFromURLString:url];
    [self setTitle:channelName];
    [self setTitle:[NSString stringWithFormat:@"%@-%@", channelName, result]];
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
    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Result Cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Result Cell"];
    }
    [cell setSelectionStyle:UITableViewCellEditingStyleNone];
    NSString *url = [self urlStringWithID:channelID infoID:[indexPath row]];
    NSString *result = [self contentFromURLString:url];
    [[cell textLabel] setText:result];
    return cell;
}

- (NSString *)contentFromURLString:(NSString *)urlString
{
    NSURL *urlRequest = [NSURL URLWithString:urlString];
    NSError *err = nil;
    NSString *html = [NSString stringWithContentsOfURL:urlRequest encoding:NSUTF8StringEncoding error:&err];
    int spacePos = [html rangeOfString:@"<"].location;
    return [html substringToIndex:spacePos];
}

- (NSString *)urlStringWithID:(int)cid infoID:(int)iid
{
    return [NSString stringWithFormat:@"http://mtsms.site88.net/xs/xsapi.php?id=%d&info_id=%d", cid, iid];
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
}

@end
