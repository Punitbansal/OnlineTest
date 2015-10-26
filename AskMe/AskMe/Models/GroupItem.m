//
//  GroupItem.m
//  AskMe
//
//  Created by Punit Bansal on 26/10/15.
//  Copyright © 2015 ios dev. All rights reserved.
//

#import "GroupItem.h"
#import "Item.h"

@implementation GroupItem

+(instancetype)itemFromObject:(NSDictionary *)object
{
    GroupItem * item = nil;
    if (object)
    {
        item = [[GroupItem alloc] init];
        
        NSString * temp = [object objectForKey:@"template"];
        if ([temp isEqualToString:@"product-template-1"])
        {
            item.templateType = eTemplate1;
        }
        else if ([temp isEqualToString:@"product-template-2"])
        {
            item.templateType = eTemplate2;
        }
        else if ([temp isEqualToString:@"product-template-3"])
        {
            item.templateType = eTemplate3;
        }
        
        NSArray * allItems = [object objectForKey:@"items"];
        
        for (NSDictionary * dictItem in allItems)
        {
            Item * childItem = [[Item alloc] init];
            childItem.title = [dictItem objectForKey:@"label"];
            childItem.title = [[dictItem objectForKey:@"image"] stringByReplacingOccurrencesOfString:@" " withString:@""];
            childItem.title = [[dictItem objectForKey:@"web-url"] stringByReplacingOccurrencesOfString:@" " withString:@""];
        }
    }
    return item;
}

@end
