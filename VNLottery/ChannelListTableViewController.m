//
//  ChannelListTableViewController.m
//  VNLottery
//
//  Created by East Agile on 10/4/12.
//  Copyright (c) 2012 East Agile. All rights reserved.
//

#import "ChannelListTableViewController.h"
#import "ResultTableViewController.h"
#import "ChannelCell.h"

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

- (ChannelCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ChannelCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Channel Cell"];
    if (!cell) {
        cell = [[ChannelCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Channel Cell"];
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
    [resultTableViewController setChannelName:[channelList objectAtIndex:[indexPath row]]];
    
    NSMutableArray *result;
    NSString *url = [NSString stringWithFormat:@"http://mtsms.site88.net/xs/xsapi.php?id=%d", [indexPath row]];
    result = [[NSMutableArray alloc] initWithArray:[self resultFromURLString:url]];
    for (int i = 2; i < [result count] / 2 + 1; i++) {
        NSMutableArray *temp = [result objectAtIndex:i];
        [result setObject:[result objectAtIndex:[result count] + 1 - i] atIndexedSubscript:i];
        [result setObject:temp atIndexedSubscript:[result count] + 1 - i];
    }
    [resultTableViewController setResult:result];
    
    [self.navigationController pushViewController:resultTableViewController animated:YES];
    ChannelCell *cell = (ChannelCell *)[tableView cellForRowAtIndexPath:indexPath];
    [[cell activityIndicator] stopAnimating];
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ChannelCell *cell = (ChannelCell *)[tableView cellForRowAtIndexPath:indexPath];
    [[cell activityIndicator] startAnimating];
    return indexPath;
}

- (NSArray *)resultFromURLString:(NSString *)urlString
{
    NSMutableArray *returnArr = [[NSMutableArray alloc] init];
    NSURL *urlRequest = [NSURL URLWithString:urlString];
    NSError *err = nil;
    NSString *html = [NSString stringWithContentsOfURL:urlRequest encoding:NSUTF8StringEncoding error:&err];
    int trimPos = [html rangeOfString:@"\n<!-- Hosting24 Analytics Code -->"].location;
    NSMutableString *localResult = [[NSMutableString alloc] initWithString:[html substringToIndex:trimPos]];
    NSArray *arrLevel1 = [self arrayOfString:localResult splitedBy:@"<br/><br/>"];
    for (int i = 0; i < [arrLevel1 count]; i++) {
        NSArray *arrLevel2 = [self arrayOfString:[arrLevel1 objectAtIndex:i] splitedBy:@"<br/>"];
        [returnArr addObject:arrLevel2];
    }
    return returnArr;
}

- (NSArray *)arrayOfString:(NSString *)orgString splitedBy:(NSString *)splitString
{
    NSMutableArray *returnArr = [[NSMutableArray alloc] init];
    NSMutableString *tempString = [[NSMutableString alloc] initWithString:orgString];
    while ([tempString length]) {
        NSRange elemTrimRange = [tempString rangeOfString:splitString];
        NSString *elemContent;
        if (elemTrimRange.location != NSNotFound) {
            elemContent = [tempString substringToIndex:elemTrimRange.location];
            [tempString deleteCharactersInRange:NSRangeFromString([NSString stringWithFormat:@"{0 %d}", elemTrimRange.location + elemTrimRange.length])];
        } else {
            elemContent = [NSString stringWithString:tempString];
            [tempString deleteCharactersInRange:NSRangeFromString([NSString stringWithFormat:@"{0 %d}", [tempString length]])];
        }
        [returnArr addObject:elemContent];
        
    }
    return returnArr;
}

@end
