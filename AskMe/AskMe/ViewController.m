//
//  ViewController.m
//  AskMe
//
//  Created by Punit Bansal on 26/10/15.
//  Copyright © 2015 ios dev. All rights reserved.
//

#import "ViewController.h"
#import "JsonParser.h"
#import "GroupItem.h"
#import "UIImageView+WebCache.h"
#import "Item.h"
#import "CustomCells.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
{
    NSMutableArray * groupItems;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //[[UINavigationBar appearance] setTintColor:[UIColor blueColor]];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:60/255.0 green:82/255.0 blue:188/255.0 alpha:1.0];
    
    tableView.estimatedRowHeight = 50;
    [self loadJson];
    // Do any additional setup after loading the view, typically from a nib.
}


// Prses the JSON File
- (NSArray *)loadJson
{
    groupItems = [NSMutableArray array];
    
    NSString * path = [[NSBundle mainBundle] pathForResource:@"f_two" ofType:@"json"];
    NSError * error = nil;
    id parsedObject = [JsonParser parseJSON:[NSData dataWithContentsOfFile:path] error:&error];
    if ([parsedObject isKindOfClass:[NSArray class]])
    {
        for (NSDictionary * item in parsedObject)
        {
            GroupItem * groupItem = [GroupItem itemFromObject:item];
            if (groupItem)
            {
                [groupItems addObject:groupItem];
            }
        }
    }
    else
    {
        NSLog(@"%@",[error description]);
    }
    
    return groupItems;
}

#pragma Mark -
#pragma Mark UITableView Methods


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;
{
    return groupItems.count;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView_ cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    GroupItem * item = [groupItems objectAtIndex:indexPath.section];
    
    switch (item.templateType) {
        case eTemplate1:
        {
            SingleItemCell * cell = (SingleItemCell *)[tableView dequeueReusableCellWithIdentifier:@"SingleItemCell"];
            [cell.mainImageView sd_setImageWithURL:[NSURL URLWithString:((Item *)[item.items objectAtIndex:0]).imageUrl] placeholderImage:nil];
            cell.mainImageView.layer.borderColor = [[UIColor grayColor] CGColor];
            cell.mainImageView.layer.borderWidth = 1.0;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }
        case eTemplate2:
        {
            MultiItemCell * cell = (MultiItemCell *)[tableView dequeueReusableCellWithIdentifier:@"MultiItemCell"];
            cell.groupItem = item;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }
        case eTemplate3:
        {
            MultiItemLargeCell * cell = (MultiItemLargeCell *)[tableView dequeueReusableCellWithIdentifier:@"MultiItemLargeCell"];
            cell.groupItem = item;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section;
{
    GroupItem * item = [groupItems objectAtIndex:section];

    return item.titleString;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    return UITableViewAutomaticDimension;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
{
    GroupItem * item = [groupItems objectAtIndex:indexPath.section];
    
    if (item.templateType == eTemplate1)
    {
        NSURL * url = [NSURL URLWithString:((Item *)[item.items objectAtIndex:0]).webUrl];
        if ([[UIApplication sharedApplication] canOpenURL:url])
        [[UIApplication sharedApplication] openURL:url];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
