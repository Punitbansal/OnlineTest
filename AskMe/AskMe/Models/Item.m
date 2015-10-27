//
//  Item.m
//  AskMe
//
//  Created by Punit Bansal on 26/10/15.
//  Copyright © 2015 ios dev. All rights reserved.
//

#import "Item.h"

@implementation Item

+(instancetype)itemFromObject:(NSDictionary *)object
{
    Item * item = nil;
    if (object)
    {
        item = [[Item alloc] init];
        item.title = [object objectForKey:@"label"];
        item.imageUrl = [[object objectForKey:@"image"] stringByReplacingOccurrencesOfString:@" " withString:@""];
        item.webUrl = [[object objectForKey:@"web-url"] stringByReplacingOccurrencesOfString:@" " withString:@""];
    }
    return item;
}
@end
