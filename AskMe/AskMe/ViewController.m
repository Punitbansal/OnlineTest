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

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadJson];
    // Do any additional setup after loading the view, typically from a nib.
}


// Prses the JSON File
- (NSArray *)loadJson
{
    NSMutableArray * groupItems = [NSMutableArray array];
    
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
